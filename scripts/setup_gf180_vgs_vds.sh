#!/bin/bash
# setup_gf180_vgs_vds.sh
#
# (Re)generates the PDK-derived part of the GF180MCU gm/id/vgs/vds overlay:
# the patched FET symbols in designs/libs/gf180mcu_local/symbols/.
#
# The other files in designs/libs/gf180mcu_local/ are committed source and are
# NOT touched by this script:
#   xschemrc          <- ready-to-copy block xschemrc (prepends symbols/, sources
#                         fet_autosave.tcl)
#   fet_autosave.tcl  <- "GF180 > Create FET .save file" menu (auto .save lines)
#   README.md         <- usage notes
#
# How it works: the committed xschemrc sources the PDK xschemrc, then PREPENDS
# this folder to XSCHEM_LIBRARY_PATH so the patched symbols win over the PDK
# originals (xschem uses the first match). A teammate just copies that xschemrc
# into their block folder -- nothing else to set up.
#
# Usage:
#   cd <project root>
#   ./scripts/setup_gf180_vgs_vds.sh
#
# To revert:
#   ./scripts/revert_gf180_vgs_vds.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

PDK_XSCHEM="/foss/pdks/gf180mcuD/libs.tech/xschem"
LOCAL_LIB="$PROJECT_ROOT/designs/libs/gf180mcu_local"

if [ ! -d "$PDK_XSCHEM" ]; then
    echo "ERROR: GF180MCU PDK not found at $PDK_XSCHEM"
    echo "       Make sure /foss/pdks/gf180mcuD/ exists."
    exit 1
fi

echo "============================================================"
echo " Setup GF180MCU vgs/vds overlay (project-local, committable)"
echo "============================================================"
echo " PDK source : $PDK_XSCHEM"
echo " Local lib  : $LOCAL_LIB"
echo ""

# -- 1. Create directory ------------------------------------------------------
echo "[1/3] Creating project-local library directory..."
mkdir -p "$LOCAL_LIB/symbols"
echo "      OK -> $LOCAL_LIB/symbols/"

# -- 2. Copy all FET symbols --------------------------------------------------
echo "[2/3] Copying FET symbol files from PDK..."
count=0
for sym in "$PDK_XSCHEM"/symbols/{n,p}fet_*.sym; do
    cp "$sym" "$LOCAL_LIB/symbols/"
    echo "      Copied: $(basename "$sym")"
    count=$((count + 1))
done
echo "      Total: $count files copied."

# -- 3. Patch each symbol (Python) --------------------------------------------
echo "[3/3] Patching symbols..."
echo "      - Removing hide=true from gm and id"
echo "      - Adding vgs/vds (node voltage approach)"

LOCAL_LIB="$LOCAL_LIB" python3 << 'PYEOF'
import os

local_sym_dir = os.path.join(os.environ["LOCAL_LIB"], "symbols")

patched = []
skipped = []

for fname in sorted(os.listdir(local_sym_dir)):
    if not fname.endswith(".sym"):
        continue

    fpath = os.path.join(local_sym_dir, fname)

    with open(fpath, "r") as f:
        content = f.read()

    # If already patched, skip
    if "spice_get_voltage" in content:
        skipped.append(fname)
        continue

    # Step A: Remove hide=true from the gm and id blocks
    # Original format:  {layer=15\nhide=true}
    # Result:           {layer=15}
    if "{layer=15\nhide=true}" not in content:
        print(f"  WARNING: hide=true pattern not found in {fname} -- skip")
        skipped.append(fname)
        continue

    content = content.replace("{layer=15\nhide=true}", "{layer=15}")

    # Step B: Decide text position based on transistor type
    # NMOS: S is at the bottom (Y=+30), text at Y=17.5
    # PMOS: S is at the top (Y=-30), text at Y=-17.5
    is_pmos = "type=pmos" in content
    y_pos = "-17.5" if is_pmos else "17.5"

    # Step C: Append vgs/vds at the end of the file
    # Approach: node voltage (independent of subcircuit hierarchy)
    # @#0=D, @#1=G, @#2=S -- pin order is the same for all GF180MCU FETs
    vgs_vds_line = (
        f'T {{vgs=expr(@#1:spice_get_voltage - @#2:spice_get_voltage )\n'
        f'vds=expr(@#0:spice_get_voltage - @#2:spice_get_voltage )}} '
        f'5 {y_pos} 0 1 0.07 0.07 {{layer=15}}\n'
    )

    content = content.rstrip("\n") + "\n" + vgs_vds_line

    with open(fpath, "w") as f:
        f.write(content)

    kind = "PMOS" if is_pmos else "NMOS"
    patched.append(fname)
    print(f"      Patched [{kind}]: {fname}")

print(f"\n      Result: {len(patched)} patched, {len(skipped)} skipped.")
if skipped:
    print(f"      Skipped: {', '.join(skipped)}")
PYEOF

# -- Done ---------------------------------------------------------------------
echo ""
echo "============================================================"
echo " DONE"
echo "============================================================"
echo ""
echo " Regenerated the PDK-derived patched symbols:"
echo "   $LOCAL_LIB/symbols/"
echo ""
echo " The rest of $LOCAL_LIB is committed source (not regenerated here):"
echo "   xschemrc          -> copy into a block folder to use the overlay"
echo "   fet_autosave.tcl  -> adds the 'GF180 > Create FET .save file' menu"
echo "   README.md         -> usage notes"
echo ""
echo " Verify: open a schematic, run OP, press Ctrl+I (annotate)."
echo " Revert: ./scripts/revert_gf180_vgs_vds.sh"
echo ""

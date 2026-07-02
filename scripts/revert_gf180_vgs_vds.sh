#!/bin/bash
# revert_gf180_vgs_vds.sh
#
# Disables the overlay by removing only the PDK-derived patched symbols
# (designs/libs/gf180mcu_local/symbols/). The committed source files in that
# folder (xschemrc, fet_autosave.tcl, README.md) are left in place.
#
# The project xschemrc files just prepend this folder to the library path; once
# symbols/ is gone xschem doesn't find the patched symbols there and falls back
# to the plain PDK symbols -- no edits to those files are needed.
#
# NOTE: symbols/ is committed to git. After running this, `git status` will show
# it as deleted; run `git restore` (or the setup script) to bring it back.
#
# Also cleans up the legacy $HOME-based install from older setup versions.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
LOCAL_LIB="$PROJECT_ROOT/designs/libs/gf180mcu_local"

# Legacy $HOME locations (older setup versions)
HOME_LIB="$HOME/xschem_library/gf180mcu_local"
XSCHEMRC="$HOME/.xschem/xschemrc"
BACKUP="$HOME/.xschem/xschemrc.bak_gf180"

echo "============================================================"
echo " Revert GF180MCU vgs/vds setup"
echo "============================================================"

if [ -d "$LOCAL_LIB/symbols" ]; then
    rm -rf "$LOCAL_LIB/symbols"
    echo " OK -> removed patched symbols: $LOCAL_LIB/symbols/"
    echo "       Schematics now fall back to plain PDK symbols."
    echo "       (git-tracked: run 'git restore' or the setup script to undo.)"
    echo "       Kept: xschemrc, fet_autosave.tcl, README.md (committed source)."
else
    echo " Patched symbols not found (nothing to remove): $LOCAL_LIB/symbols/"
fi

# Legacy cleanup
if [ -f "$BACKUP" ]; then
    cp "$BACKUP" "$XSCHEMRC"
    echo " OK -> restored legacy $XSCHEMRC from backup."
fi
if [ -d "$HOME_LIB" ]; then
    rm -rf "$HOME_LIB"
    echo " OK -> removed legacy $HOME library: $HOME_LIB"
fi

echo ""
echo " To re-enable:"
echo "   ./scripts/setup_gf180_vgs_vds.sh"

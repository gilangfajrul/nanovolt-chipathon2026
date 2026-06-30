# gf180mcu_local — GF180MCU symbols with gm/id/vgs/vds overlay

Patched copies of the GF180MCU FET symbols that, after an OP simulation, show
**gm, id, vgs, vds** directly on each transistor in xschem.

These files are committed, so once you pull the repo you already have them — you
do **not** need to run any setup script.

```
gf180mcu_local/
├── symbols/          patched FET symbols (gm/id un-hidden, vgs/vds added)
├── xschemrc          ready-to-use xschemrc — copy this into your block folder
├── fet_autosave.tcl  adds the "GF180 > Create FET .save file" menu
└── README.md         this file
```

## How to use it (copy one file)

Copy [`xschemrc`](xschemrc) into your block folder:

```sh
cp designs/libs/gf180mcu_local/xschemrc  <your-block-folder>/
```

Then launch xschem from that folder — done. The file loads the PDK, puts the
patched symbols ahead of the PDK ones, and adds your block's own folder so its
`*.sym` files resolve too. Nothing else to set up.

If your repo is **not** at `/foss/designs/nanovolt-chipathon2026`, open the
copied `xschemrc` and fix the one path on the `set XSCHEM_LIBRARY_PATH ...` line.

## Verify

1. Open a schematic that uses the GF180 FETs in xschem.
2. Run an **OP** simulation.
3. Press **Ctrl+I** (annotate) — gm/id/vgs/vds appear on each transistor.

> Sanity check on first use: the vgs/vds overlay assumes pin order
> `@#0=D, @#1=G, @#2=S`. On a diode-connected NMOS, vds should equal vgs.

## gm and id on many FETs (the `.save` problem)

`vgs`/`vds` come from node voltages (always in the raw), but `gm`/`id` are
internal device parameters that ngspice only writes to the raw if you `.save`
them — and `save all` does **not** include them. Listing every device by hand
gets old fast, so use the menu:

1. Open your block (e.g. an OTA) in xschem.
2. **GF180 → Create FET .save file** — this walks the whole hierarchy, finds
   every nfet/pfet, and writes `<schematic>.save` (into `netlist_dir`) with a
   full gm/ID parameter set per device:
   `id gm gds gmbs vth vdsat cgg cgs cgd cdd`.
   (Only id/gm are annotated on the symbol; the rest are in the raw for analysis
   — intrinsic gain gm/gds, ft = gm/(2·π·cgg), body effect gmbs, region, etc.)
3. In your testbench, add `.include <schematic>.save` next to the `.op`.
4. Netlist → Simulate → Annotate (Ctrl+I) — gm/id now show on every FET.

The menu is provided by `fet_autosave.tcl` (sourced from `xschemrc`). For a
single transistor you can skip it and just write the one `save` line by hand
(see `saradc/tb/test_nfet_03v3.sch`).

## Regenerate from the PDK (maintainers only)

`./scripts/setup_gf180_vgs_vds.sh` re-copies and re-patches the symbols. Normal
users never need this.

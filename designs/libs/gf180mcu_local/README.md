# gf180mcu_local — GF180MCU symbols with gm/id/vgs/vds overlay

Patched copies of the GF180MCU FET symbols that, after an OP simulation, show
**gm, id, vgs, vds** directly on each transistor in xschem.

These files are committed, so once you pull the repo you already have them — you
do **not** need to run any setup script.

```
gf180mcu_local/
├── symbols/    patched FET symbols (gm/id un-hidden, vgs/vds added)
├── xschemrc    ready-to-use xschemrc — copy this into your block folder
└── README.md   this file
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

## Regenerate from the PDK (maintainers only)

`./scripts/setup_gf180_vgs_vds.sh` re-copies and re-patches the symbols. Normal
users never need this.

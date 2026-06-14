# lna — Low-Noise Amplifier

First gain stage of the NanoVolt low-field MRI receiver front-end. Sets the
input-referred noise of the whole chain, so the noise/power trade-off dominates
the design here.

## Files (project convention)
- `lna.sch` — schematic (xschem)
- `lna.sym` — symbol (for instancing + testbench)
- `lna.gds` — layout (auto-registered by klayout, Ctrl+R)
- `lna_extracted.cir` — extracted netlist for LVS
- `tb/` — testbench + per-block sizing (gm/ID data in `/foss/designs/Sizing`)

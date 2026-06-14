# bias — Bias Generation

Reference currents and voltages for `lna`, `pgaaaf`, and `saradc`
(e.g. constant-gm or bandgap-derived references).

## Files (project convention)
- `bias.sch` — schematic (xschem)
- `bias.sym` — symbol (for instancing + testbench)
- `bias.gds` — layout (auto-registered by klayout, Ctrl+R)
- `bias_extracted.cir` — extracted netlist for LVS
- `tb/` — testbench + per-block sizing (gm/ID data in `/foss/designs/Sizing`)

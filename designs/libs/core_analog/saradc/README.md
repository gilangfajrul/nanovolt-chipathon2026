# saradc — SAR ADC

Successive-approximation ADC that digitizes the conditioned signal from `pgaaaf`.

Note: the analog parts (comparator, DAC, S/H) live here. The SAR **digital**
control logic may instead go through the LibreLane/digital flow (`src/`,
`librelane/`) and be integrated as a separate macro — decide before layout.

## Files (project convention)
- `saradc.sch` — schematic (xschem)
- `saradc.sym` — symbol (for instancing + testbench)
- `saradc.gds` — layout (auto-registered by klayout, Ctrl+R)
- `saradc_extracted.cir` — extracted netlist for LVS
- `tb/` — testbench + per-block sizing (gm/ID data in `/foss/designs/Sizing`)

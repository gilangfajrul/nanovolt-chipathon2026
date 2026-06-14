# pgaaaf — Programmable-Gain Amplifier + Anti-Aliasing Filter

Follows the `lna`. Provides variable gain and band-limits the signal
(anti-aliasing) before the SAR ADC samples it.

## Files (project convention)
- `pgaaaf.sch` — schematic (xschem)
- `pgaaaf.sym` — symbol (for instancing + testbench)
- `pgaaaf.gds` — layout (auto-registered by klayout, Ctrl+R)
- `pgaaaf_extracted.cir` — extracted netlist for LVS
- `tb/` — testbench + per-block sizing (gm/ID data in `/foss/designs/Sizing`)

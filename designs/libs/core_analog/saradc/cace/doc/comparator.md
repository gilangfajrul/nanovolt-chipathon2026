# comparator

- Description: StrongARM-latch comparator for the 10-bit SAR ADC
- PDK: gf180mcuD

## Authorship

- Designer: Gilang Fajrul Falah
- Company: NanoVolt (SSCS Chipathon 2026)
- Created: June 18, 2026
- License: Apache 2.0
- Last modified: None

## Pins

- vdd
  + Description: Positive supply
  + Type: power
  + Direction: inout
  + Vmin: 3.0
  + Vmax: 3.6
- vss
  + Description: Ground
  + Type: ground
  + Direction: inout
- vin1
  + Description: Positive input
  + Type: signal
  + Direction: input
- vin2
  + Description: Negative input
  + Type: signal
  + Direction: input
- clk
  + Description: Comparator clock
  + Type: digital
  + Direction: input
- X
  + Description: Output X
  + Type: signal
  + Direction: output
- Y
  + Description: Output Y
  + Type: signal
  + Direction: output

## Default Conditions

- vdd
  + Description: Supply voltage
  + Display: Vdd
  + Unit: V
  + Typical: 3.3
- vcm
  + Description: Input common-mode voltage
  + Display: Vcm
  + Unit: V
  + Typical: 1.65
- vid
  + Description: Differential input (vin1-vin2)
  + Display: Vid
  + Unit: V
  + Typical: 1e-3
- corner
  + Description: Process corner (sm141064 section name)
  + Display: Corner
  + Typical: typical
- temperature
  + Description: Ambient temperature
  + Display: Temp
  + Unit: °C
  + Typical: 27

## Symbol

![Symbol of comparator](comparator_symbol.svg)

## Schematic

![Schematic of comparator](comparator_schematic.svg)

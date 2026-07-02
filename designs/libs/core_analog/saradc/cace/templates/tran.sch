v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {comparator.sym} 850 -100 0 0 {name=x1}
C {lab_pin.sym} 800 -310 0 0 {name=l_vdd sig_type=std_logic lab=VDD}
C {lab_pin.sym} 800 -280 0 0 {name=l_vip sig_type=std_logic lab=VINP}
C {lab_pin.sym} 800 -240 0 0 {name=l_vin sig_type=std_logic lab=VINN}
C {lab_pin.sym} 800 -220 0 0 {name=l_clk sig_type=std_logic lab=CLK}
C {lab_pin.sym} 800 -200 0 0 {name=l_vss sig_type=std_logic lab=VSS}
C {lab_pin.sym} 980 -270 0 1 {name=l_x sig_type=std_logic lab=X}
C {lab_pin.sym} 980 -250 0 1 {name=l_y sig_type=std_logic lab=Y}
C {code_shown.sym} 80 -560 0 0 {name=SETUP
simulator=ngspice
only_toplevel=false
value="
* ---- PDK models + corner, DUT, temperature (CACE-substituted) ----
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
.include CACE\{DUT_path\}
.temp CACE\{temperature\}
.option warn=1

* ---- supplies / clock / differential stimulus ----
Vvdd VDD 0 CACE\{vdd\}
Vvss VSS 0 0
Vclk CLK 0 pulse(0 CACE\{vdd\} 1n 50p 50p 4.4n 10n)
Vinp VINP 0 CACE[CACE\{vcm\} + CACE\{vid\}/2]
Vinn VINN 0 CACE[CACE\{vcm\} - CACE\{vid\}/2]
Cx X 0 20f
Cy Y 0 20f
"}
C {code_shown.sym} 80 -260 0 0 {name=CONTROL
simulator=ngspice
only_toplevel=false
value="
.control
tran 5p 12n
* regeneration time = (clk edge @1n) -> |X-Y| reaches 0.9*VDD
let vda = abs(v(X)-v(Y))
meas tran tcross when vda=CACE[0.9 * CACE\{vdd\}] cross=1
let tregen = tcross - 1e-9
echo \"$&tregen\" > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}

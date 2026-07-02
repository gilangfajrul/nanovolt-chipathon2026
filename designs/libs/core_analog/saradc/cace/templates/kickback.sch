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
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/design.ngspice
.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/ngspice/sm141064.ngspice CACE\{corner\}
.include CACE\{DUT_path\}
.temp CACE\{temperature\}
.option warn=1

* ---- drive inputs through the CDAC source impedance (set rsw/csrc to your array) ----
.param rsw=200
.param csrc=1p
Vvdd VDD 0 CACE\{vdd\}
Vvss VSS 0 0
Vclk CLK 0 pulse(0 CACE\{vdd\} 1n 50p 50p 4.4n 10n)
Vsp SP 0 CACE[CACE\{vcm\} + CACE\{vid\}/2]
Vsn SN 0 CACE[CACE\{vcm\} - CACE\{vid\}/2]
Rsp SP VINP rsw
Rsn SN VINN rsw
Csp VINP 0 csrc
Csn VINN 0 csrc
Cx X 0 20f
Cy Y 0 20f
"}
C {code_shown.sym} 80 -260 0 0 {name=CONTROL
simulator=ngspice
only_toplevel=false
value="
.control
tran 2p 40n
* peak-peak excursion on vin1 = kickback
meas tran vinp_hi max v(VINP)
meas tran vinp_lo min v(VINP)
let kick = vinp_hi - vinp_lo
echo \"$&kick\" > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
.endc
"}

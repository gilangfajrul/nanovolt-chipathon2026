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
C {code_shown.sym} 80 -200 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {code_shown.sym} 60 -820 0 0 {name=STIMULUS only_toplevel=true value="
* -------------- KICKBACK: input disturbance through the CDAC source impedance --------------
* Drive the comparator inputs through the sampling-switch resistance + the cap held at the
* node, then watch V(VINP)/V(VINN) get kicked on the CK edges (via Cgd/Cgs of M1/M2 and M7).
* Set rsw / csrc to your real CDAC (switch Ron and the array Ctot seen during hold).
.param vcm=1.65
.param vid=1m
.param rsw=200          ; CDAC sampling-switch on-resistance [ohm]
.param csrc=1p          ; cap seen at the comparator input during hold [F]
Vvdd VDD 0 3.3
Vvss VSS 0 0
Vclk CLK 0 pulse(0 3.3 1n 50p 50p 4.4n 10n)
Vsp SP 0 'vcm+vid/2'
Vsn SN 0 'vcm-vid/2'
Rsp SP VINP rsw
Rsn SN VINN rsw
Csp VINP 0 csrc
Csn VINN 0 csrc
Cx X 0 20f
Cy Y 0 20f
.control
save all
tran 2p 40n
write comparator_tb_kickback.raw tran1.all
* peak input excursion (kickback) over the run
meas tran vinp_hi max v(VINP)
meas tran vinp_lo min v(VINP)
meas tran vinn_hi max v(VINN)
meas tran vinn_lo min v(VINN)
let kick_p = vinp_hi - vinp_lo
let kick_n = vinn_hi - vinn_lo
print kick_p kick_n
plot v(CLK) v(VINP) v(VINN)
.endc
"}

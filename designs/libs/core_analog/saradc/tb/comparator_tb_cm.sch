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
C {code_shown.sym} 60 -800 0 0 {name=STIMULUS only_toplevel=true value="
* -------------- COMMON-MODE / decision-range sweep --------------
* Sweep VCM with a fixed small +vid; confirm X/Y still split rail-to-rail (i.e. the NMOS
* input pair stays on). Where X/Y fail to separate -> VCM too low (Vcm < Vth + Vdsat,tail).
.param vcm=1.65
.param vid=2m
Vvdd VDD 0 3.3
Vvss VSS 0 0
Vclk CLK 0 pulse(0 3.3 1n 50p 50p 4.4n 10n)
Vinp VINP 0 'vcm+vid/2'
Vinn VINN 0 'vcm-vid/2'
Cx X 0 20f
Cy Y 0 20f
.control
* whitespace-delimited table -> pandas read_csv(sep=r'\s+') or numpy loadtxt(skiprows=1)
echo vcm vx vy > comparator_tb_cm.txt
foreach vc 0.8 1.0 1.2 1.4 1.6 1.8 2.0 2.2 2.5
  alterparam vcm=$vc
  reset
  tran 5p 12n
  meas tran vx find v(X) at=5n
  meas tran vy find v(Y) at=5n
  echo $vc $&vx $&vy >> comparator_tb_cm.txt
end
.endc
"}

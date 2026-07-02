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
C {code_shown.sym} 80 -200 0 0 {name=MODELS only_toplevel=true value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
"}
C {code_shown.sym} 65 -720 0 0 {name=STIMULUS only_toplevel=true value="
* --- StrongARM comparator: regeneration-TIME measurement (real parasitics) ---
* net map (lab_pins on x1): vin1->VINP vin2->VINN clk->CLK ; outputs X,Y
* clk: reset(low) 0-1n, eval(high) 1-5.4n. t_reg = (loser falls to 10%VDD) - 1n.
.param vcm=1.65
.param vid=1m
Vvdd VDD 0 3.3
Vvss VSS 0 0
Vclk CLK 0 pulse(0 3.3 1n 50p 50p 4.4n 10n)
Vinp VINP 0 'vcm+vid/2'
Vinn VINN 0 'vcm-vid/2'
Cx X 0 20f
Cy Y 0 20f
.tran 5p 6n

.control
set noaskquit
foreach vv 100m 10m 1m 0.9766m 0.3m 0.1m 30u 10u 3u
  alterparam vid=$vv
  reset
  tran 5p 6n
  meas tran tfx when v(X)=0.33 fall=1
  meas tran tfy when v(Y)=0.33 fall=1
  echo ROW vid=$vv tfx=$&tfx tfy=$&tfy
end
.endc
"}

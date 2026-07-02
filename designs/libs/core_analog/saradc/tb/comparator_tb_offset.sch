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
C {code_shown.sym} 50 -1000 0 0 {name=STIMULUS only_toplevel=true value="
* -------------- OFFSET: input-referred trip voltage --------------
* Nominal/systematic offset = the vid where the clocked decision V(X)-V(Y) flips sign.
* For random sigma_offset, enable the GF180 mismatch models and wrap the sweep in Monte-Carlo.
.param voff=0            ; differential input applied to nominally-matched inputs
Vvdd VDD 0 3.3
Vvss VSS 0 0
Vclk CLK 0 pulse(0 3.3 1n 50p 50p 4.4n 10n)
Vinp VINP 0 '1.65+voff/2'
Vinn VINN 0 '1.65-voff/2'
Cx X 0 20f
Cy Y 0 20f
.control
* whitespace-delimited table -> pandas read_csv(sep=r's+') or numpy loadtxt(skiprows=1)
echo vid vx_minus_vy > comparator_tb_offset.txt
foreach vv -10m -7m -5m -3m -2m -1.5m -1m -0.5m 0 0.5m 1m 1.5m 2m 3m 5m 7m 10m
  alterparam voff=$vv
  reset
  tran 5p 12n
  meas tran dvx find v(X) at=5n
  meas tran dvy find v(Y) at=5n
  let dxy = dvx - dvy
  echo $vv $&dxy >> comparator_tb_offset.txt
end
.endc
* ---- random offset (Monte-Carlo) skeleton: needs the GF180 statistical/mismatch models ----
* .control
* let nmc=200
* let i=0
* dowhile i < nmc
*   reset                 ; + draw a new mismatch sample (PDK montecarlo section / setseed)
*   <repeat the vid sweep, bisect to the V(X)-V(Y) zero-crossing -> voff_i>
*   let i = i + 1
* end
* ; mean(voff)=systematic offset , std(voff)=random sigma_offset
* .endc
"}

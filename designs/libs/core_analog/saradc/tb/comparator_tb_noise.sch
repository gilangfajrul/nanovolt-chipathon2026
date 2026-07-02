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
C {code_shown.sym} 60 -900 0 0 {name=STIMULUS only_toplevel=true value="
* -------------- NOISE: clocked decision statistics (Razavi 1/0-counting) --------------
* NOTE: ngspice has NO device thermal noise in .tran, so the comparator's input-referred
* noise is injected EXPLICITLY as a per-cycle random offset (trnoise, new sample each clock
* period). sigma comes from eq.15 / comp_sizing.ipynb. This characterises the DECISION-ERROR
* statistics / metastability and verifies the 1/0-counting extraction; it is NOT a device-noise
* measurement (for that use eq.15, or a transient-noise simulator like Spectre/AFS).
.param vcm=1.65
.param vs=1m            ; deliberate small input (Razavi V_S)
.param signa=0.6m       ; input-referred noise sigma [V] from eq.15
Vvdd VDD 0 3.3
Vvss VSS 0 0
Vclk CLK 0 pulse(0 3.3 1n 50p 50p 4.4n 10n)
* one independent N(0,signa) offset per 10n clock cycle, injected differentially
Vnz NZ 0 trnoise(signa 10n 0 0)
Bvinp VINP 0 V = vcm + vs/2 + V(NZ)/2
Bvinn VINN 0 V = vcm - vs/2 - V(NZ)/2
Cx X 0 20f
Cy Y 0 20f
.control
save v(X) v(Y) v(CLK)
tran 5p 2u             ; 200 clock cycles -> 200 decisions
write comparator_tb_noise.raw tran1.all
.endc
* post-process (Python on the raw, or in ngspice): sample d = V(X)-V(Y) at each eval
* (t = 5n + k*10n, k=0..199); P1 = count(d>0)/200; recovered sigma = vs / invnorm(P1).
* Sweep vs and check sigma is stable -> confirms the counting method, then trust eq.15.
"}

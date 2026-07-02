v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1030 -1080 1830 -680 {flags=graph
y1=-0.021
y2=3.5
ypos1=-0.021
ypos2=3.5
divy=5
subdivy=1
unity=1
x1=0
x2=1.15e-07
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="y
x
clk
sample"
color="4 5 6 7"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
digital=1
sim_type=tran
autoload=0
rawfile=$netlist_dir/sar_cl_tb.raw
vlegend=0
rainbow=1}
B 2 1030 -1520 1830 -1120 {flags=graph
y1=0.47
y2=2.9
ypos1=-0.72427504
ypos2=3.8621965
divy=5
subdivy=4
unity=1
x1=0
x2=1.15e-07
divx=5
subdivx=4
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1
digital=0
sim_type=tran
autoload=0
rawfile=$netlist_dir/sar_cl_tb.raw
vlegend=0
rainbow=1
color="4 5"
node="topp
topn"}
N 1380 -590 1440 -590 {lab=topn}
N 1440 -600 1440 -590 {lab=topn}
N 1440 -600 1520 -600 {lab=topn}
N 1380 -570 1440 -570 {lab=topp}
N 1440 -570 1440 -560 {lab=topp}
N 1440 -560 1520 -560 {lab=topp}
N 1380 -550 1400 -550 {lab=vss}
N 1400 -550 1400 -520 {lab=vss}
N 1400 -520 1520 -520 {lab=vss}
N 1500 -540 1520 -540 {lab=clk}
C {cdac.sym} 1230 -500 0 0 {name=x1}
C {title.sym} 190 -60 0 0 {name=l1 author="Gilang Fajrul Falah"}
C {comparator.sym} 1570 -420 0 0 {name=x2}
C {lab_pin.sym} 1080 -590 0 0 {name=p11 sig_type=std_logic lab=dnN[8:0]}
C {lab_pin.sym} 1080 -570 0 0 {name=p12 sig_type=std_logic lab=upN[8:0]}
C {lab_pin.sym} 1080 -550 0 0 {name=p13 sig_type=std_logic lab=dnP[8:0]}
C {lab_pin.sym} 1080 -530 0 0 {name=p14 sig_type=std_logic lab=upP[8:0]}
C {lab_pin.sym} 1080 -510 0 0 {name=p15 sig_type=std_logic lab=vrefn}
C {lab_pin.sym} 1080 -490 0 0 {name=p16 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 1080 -470 0 0 {name=p17 sig_type=std_logic lab=vrefp}
C {lab_pin.sym} 1080 -450 0 0 {name=p18 sig_type=std_logic lab=sample}
C {lab_pin.sym} 1080 -430 0 0 {name=p19 sig_type=std_logic lab=vinn}
C {lab_pin.sym} 1080 -410 0 0 {name=p20 sig_type=std_logic lab=vinp}
C {lab_pin.sym} 1500 -540 0 0 {name=p1 sig_type=std_logic lab=clk}
C {lab_pin.sym} 1520 -630 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 1440 -590 0 0 {name=p5 sig_type=std_logic lab=topn}
C {lab_pin.sym} 1440 -570 0 0 {name=p6 sig_type=std_logic lab=topp}
C {lab_pin.sym} 1400 -550 0 0 {name=p7 sig_type=std_logic lab=vss}
C {lab_pin.sym} 1700 -590 0 1 {name=p3 sig_type=std_logic lab=x}
C {lab_pin.sym} 1700 -570 0 1 {name=p4 sig_type=std_logic lab=y}
C {code_shown.sym} 20 -220 0 0 {name=MODELS only_toplevel=true value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical
"}
C {code_shown.sym} 10 -4020 0 0 {name=STIMULUS only_toplevel=true value="
* ============ SAR closed-loop reactive TB ============
* SAR FSM lives in .control: sample -> 10x[ stop@eval, read v(x),
* decide bit (X>1.65 => 1), alter CDAC caps per SAR rule, resume ].
* Drive .param vid from the notebook (vid = (code-512)*LSB + LSB/2) for
* code reproduction and coherent-sine ENOB sweeps.
* SAR rule: bit=1 -> dnP[c]+upN[c] ; bit=0 -> upP[c]+dnN[c] ; cap c=k-1, MSB free.

* ---- supplies / refs / clock / loads ----
Vvdd vdd 0 3.3
Vvss vss 0 0
Vvrefp vrefp 0 1
Vvrefn vrefn 0 0
Vvcm vcm 0 0.5
Vsample sample 0 PWL(0 3.3 9n 3.3 9.05n 0)
Vclk clk 0 pulse(0 3.3 15n 50p 50p 4n 10n)
Cx x 0 20f
Cy y 0 20f

* ---- differential input (override vid externally) ----
.param CM = 1.65
.param vid = 0.9385
Vvinp vinp 0 'CM+vid/2'
Vvinn vinn 0 'CM-vid/2'

* ---- 36 CDAC control sources (idle; reactively altered) ----
VupP8 upP[8] 0 0
VupP7 upP[7] 0 0
VupP6 upP[6] 0 0
VupP5 upP[5] 0 0
VupP4 upP[4] 0 0
VupP3 upP[3] 0 0
VupP2 upP[2] 0 0
VupP1 upP[1] 0 0
VupP0 upP[0] 0 0
VdnP8 dnP[8] 0 0
VdnP7 dnP[7] 0 0
VdnP6 dnP[6] 0 0
VdnP5 dnP[5] 0 0
VdnP4 dnP[4] 0 0
VdnP3 dnP[3] 0 0
VdnP2 dnP[2] 0 0
VdnP1 dnP[1] 0 0
VdnP0 dnP[0] 0 0
VupN8 upN[8] 0 0
VupN7 upN[7] 0 0
VupN6 upN[6] 0 0
VupN5 upN[5] 0 0
VupN4 upN[4] 0 0
VupN3 upN[3] 0 0
VupN2 upN[2] 0 0
VupN1 upN[1] 0 0
VupN0 upN[0] 0 0
VdnN8 dnN[8] 0 0
VdnN7 dnN[7] 0 0
VdnN6 dnN[6] 0 0
VdnN5 dnN[5] 0 0
VdnN4 dnN[4] 0 0
VdnN3 dnN[3] 0 0
VdnN2 dnN[2] 0 0
VdnN1 dnN[1] 0 0
VdnN0 dnN[0] 0 0

* ---- transient (stepped by control breakpoints) ----
.tran 20p 112n uic

.control
set noaskquit
save x topp topn
stop when time = 18.6n
stop when time = 28.6n
stop when time = 38.6n
stop when time = 48.6n
stop when time = 58.6n
stop when time = 68.6n
stop when time = 78.6n
stop when time = 88.6n
stop when time = 98.6n
stop when time = 108.6n
run
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b9 = 1
  alter VdnP8 = 3.3
  alter VupN8 = 3.3
else
  let b9 = 0
  alter VupP8 = 3.3
  alter VdnN8 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b8 = 1
  alter VdnP7 = 3.3
  alter VupN7 = 3.3
else
  let b8 = 0
  alter VupP7 = 3.3
  alter VdnN7 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b7 = 1
  alter VdnP6 = 3.3
  alter VupN6 = 3.3
else
  let b7 = 0
  alter VupP6 = 3.3
  alter VdnN6 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b6 = 1
  alter VdnP5 = 3.3
  alter VupN5 = 3.3
else
  let b6 = 0
  alter VupP5 = 3.3
  alter VdnN5 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b5 = 1
  alter VdnP4 = 3.3
  alter VupN4 = 3.3
else
  let b5 = 0
  alter VupP4 = 3.3
  alter VdnN4 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b4 = 1
  alter VdnP3 = 3.3
  alter VupN3 = 3.3
else
  let b4 = 0
  alter VupP3 = 3.3
  alter VdnN3 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b3 = 1
  alter VdnP2 = 3.3
  alter VupN2 = 3.3
else
  let b3 = 0
  alter VupP2 = 3.3
  alter VdnN2 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b2 = 1
  alter VdnP1 = 3.3
  alter VupN1 = 3.3
else
  let b2 = 0
  alter VupP1 = 3.3
  alter VdnN1 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b1 = 1
  alter VdnP0 = 3.3
  alter VupN0 = 3.3
else
  let b1 = 0
  alter VupP0 = 3.3
  alter VdnN0 = 3.3
end
resume
let nlast = length(v(x)) - 1
let xlast = v(x)[nlast]
if (xlast > 1.65)
  let b0 = 1
else
  let b0 = 0
end
let code = b9*512 + b8*256 + b7*128 + b6*64 + b5*32 + b4*16 + b3*8 + b2*4 + b1*2 + b0*1
echo "RESULT_CODE_BELOW"
print code
.endc
"}

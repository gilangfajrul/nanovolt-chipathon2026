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
rawfile=$netlist_dir/cdac_comp_tb.raw
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
rawfile=$netlist_dir/cdac_comp_tb.raw
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
C {code_shown.sym} 20 -2490 0 0 {name=STIMULUS only_toplevel=true value="
* ============ CDAC + Comparator open-loop SAR TB ============
* Two forced-code tests share the bias/clock/control below.
* To switch test: comment one TEST block, uncomment the other.
* sample 0..9n ; comparator evals at 15,25,..,105n ; cap switched at 20,30,..,100n
* SAR rule:  bit=1 -> dnP[i]+upN[i] (lower vdiff) ;  bit=0 -> upP[i]+dnN[i] (raise) ;  cap 8->0

* ---- shared supplies / references / clock / loads ----
Vvdd   VDD   0 3.3
Vvss   vss   0 0
Vvrefp vrefp 0 1
Vvrefn vrefn 0 0
Vvcm   vcm   0 0.5
Vsample sample 0 PWL(0 3.3 9n 3.3 9.05n 0)
Vclk CLK 0 pulse(0 3.3 15n 50p 50p 4n 10n)
Cx X 0 20f
Cy Y 0 20f
.param CM = 1.65

* ============ TEST A : code 682 = 1010101010   (DISABLED) ============
* .param vid = 0.333
* Vvinp  vinp  0 'CM+vid/2'
* Vvinn  vinn  0 'CM-vid/2'
* VdnP8 dnP[8] 0 PWL(0 0 19.99n 0 20n 3.3)
* VupN8 upN[8] 0 PWL(0 0 19.99n 0 20n 3.3)
* VupP7 upP[7] 0 PWL(0 0 29.99n 0 30n 3.3)
* VdnN7 dnN[7] 0 PWL(0 0 29.99n 0 30n 3.3)
* VdnP6 dnP[6] 0 PWL(0 0 39.99n 0 40n 3.3)
* VupN6 upN[6] 0 PWL(0 0 39.99n 0 40n 3.3)
* VupP5 upP[5] 0 PWL(0 0 49.99n 0 50n 3.3)
* VdnN5 dnN[5] 0 PWL(0 0 49.99n 0 50n 3.3)
* VdnP4 dnP[4] 0 PWL(0 0 59.99n 0 60n 3.3)
* VupN4 upN[4] 0 PWL(0 0 59.99n 0 60n 3.3)
* VupP3 upP[3] 0 PWL(0 0 69.99n 0 70n 3.3)
* VdnN3 dnN[3] 0 PWL(0 0 69.99n 0 70n 3.3)
* VdnP2 dnP[2] 0 PWL(0 0 79.99n 0 80n 3.3)
* VupN2 upN[2] 0 PWL(0 0 79.99n 0 80n 3.3)
* VupP1 upP[1] 0 PWL(0 0 89.99n 0 90n 3.3)
* VdnN1 dnN[1] 0 PWL(0 0 89.99n 0 90n 3.3)
* VdnP0 dnP[0] 0 PWL(0 0 99.99n 0 100n 3.3)
* VupN0 upN[0] 0 PWL(0 0 99.99n 0 100n 3.3)
* VupP8 upP[8] 0 0
* VupP6 upP[6] 0 0
* VupP4 upP[4] 0 0
* VupP2 upP[2] 0 0
* VupP0 upP[0] 0 0
* VdnP7 dnP[7] 0 0
* VdnP5 dnP[5] 0 0
* VdnP3 dnP[3] 0 0
* VdnP1 dnP[1] 0 0
* VupN7 upN[7] 0 0
* VupN5 upN[5] 0 0
* VupN3 upN[3] 0 0
* VupN1 upN[1] 0 0
* VdnN8 dnN[8] 0 0
* VdnN6 dnN[6] 0 0
* VdnN4 dnN[4] 0 0
* VdnN2 dnN[2] 0 0
* VdnN0 dnN[0] 0 0

* ============ TEST B : code 992 = 1111100000   (ACTIVE) ============
* vid = bin-center = (992-512)*LSB + LSB/2 = 0.9375 + 0.0009766
.param vid = 0.9385
Vvinp  vinp  0 'CM+vid/2'
Vvinn  vinn  0 'CM-vid/2'
VdnP8 dnP[8] 0 PWL(0 0 19.99n 0 20n 3.3)
VupN8 upN[8] 0 PWL(0 0 19.99n 0 20n 3.3)
VdnP7 dnP[7] 0 PWL(0 0 29.99n 0 30n 3.3)
VupN7 upN[7] 0 PWL(0 0 29.99n 0 30n 3.3)
VdnP6 dnP[6] 0 PWL(0 0 39.99n 0 40n 3.3)
VupN6 upN[6] 0 PWL(0 0 39.99n 0 40n 3.3)
VdnP5 dnP[5] 0 PWL(0 0 49.99n 0 50n 3.3)
VupN5 upN[5] 0 PWL(0 0 49.99n 0 50n 3.3)
VdnP4 dnP[4] 0 PWL(0 0 59.99n 0 60n 3.3)
VupN4 upN[4] 0 PWL(0 0 59.99n 0 60n 3.3)
VupP3 upP[3] 0 PWL(0 0 69.99n 0 70n 3.3)
VdnN3 dnN[3] 0 PWL(0 0 69.99n 0 70n 3.3)
VupP2 upP[2] 0 PWL(0 0 79.99n 0 80n 3.3)
VdnN2 dnN[2] 0 PWL(0 0 79.99n 0 80n 3.3)
VupP1 upP[1] 0 PWL(0 0 89.99n 0 90n 3.3)
VdnN1 dnN[1] 0 PWL(0 0 89.99n 0 90n 3.3)
VupP0 upP[0] 0 PWL(0 0 99.99n 0 100n 3.3)
VdnN0 dnN[0] 0 PWL(0 0 99.99n 0 100n 3.3)
VupP8 upP[8] 0 0
VupP7 upP[7] 0 0
VupP6 upP[6] 0 0
VupP5 upP[5] 0 0
VupP4 upP[4] 0 0
VdnP3 dnP[3] 0 0
VdnP2 dnP[2] 0 0
VdnP1 dnP[1] 0 0
VdnP0 dnP[0] 0 0
VdnN8 dnN[8] 0 0
VdnN7 dnN[7] 0 0
VdnN6 dnN[6] 0 0
VdnN5 dnN[5] 0 0
VdnN4 dnN[4] 0 0
VupN3 upN[3] 0 0
VupN2 upN[2] 0 0
VupN1 upN[1] 0 0
VupN0 upN[0] 0 0

.control
save all
tran 20p 115n
write cdac_comp_tb.raw
let vdiff  = v(topp)-v(topn)
let vcmtop = (v(topp)+v(topn))/2
* sample each decision ~3.5n into its eval window ; X high => bit 1
meas tran b9 find v(X) at=18.5n
meas tran b8 find v(X) at=28.5n
meas tran b7 find v(X) at=38.5n
meas tran b6 find v(X) at=48.5n
meas tran b5 find v(X) at=58.5n
meas tran b4 find v(X) at=68.5n
meas tran b3 find v(X) at=78.5n
meas tran b2 find v(X) at=88.5n
meas tran b1 find v(X) at=98.5n
meas tran b0 find v(X) at=108.5n
print b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
plot v(CLK) v(X) v(Y)
.endc
"}

v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 840 -1280 2080 -760 {flags=graph
y1=0
y2=3.3
ypos1=-0.2
ypos2=2.6
divy=5
subdivy=1
unity=1
x1=5e-12
x2=3e-06
divx=6
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="sample
topp
topn
vcm
vdiff"
color="4 5 6 7 8"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/cdac_tb.raw
sim_type=tran
autoload=1
hilight_wave=1
legend=1}
C {code_shown.sym} 60 -220 0 0 {name=MODELS only_toplevel=true value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical
"}
C {code_shown.sym} 50 -1300 0 0 {name=STIMULUS only_toplevel=true value="
* VCM-based CDAC functional TB : sample(0..1u) -> switch MSB(1.2u) -> +bit6(2u)
Vvss   vss   0 0
Vvrefp vrefp 0 2.5
Vvrefn vrefn 0 0
Vvcm   vcm   0 1.25
Vvinp  vinp  0 1.25      ; zero differential input, CM=vcm
Vvinn  vinn  0 1.25
Vsample sample 0 PWL(0 3.3  1u 3.3  1.02u 0)
VupP8 upP[8] 0 PWL(0 0 1.18u 0 1.2u 3.3)
VdnP8 dnP[8] 0 0
VupP7 upP[7] 0 0
VdnP7 dnP[7] 0 0
VupP6 upP[6] 0 0
VdnP6 dnP[6] 0 PWL(0 0 1.98u 0 2u 3.3)
VupP5 upP[5] 0 0
VdnP5 dnP[5] 0 0
VupP4 upP[4] 0 0
VdnP4 dnP[4] 0 0
VupP3 upP[3] 0 0
VdnP3 dnP[3] 0 0
VupP2 upP[2] 0 0
VdnP2 dnP[2] 0 0
VupP1 upP[1] 0 0
VdnP1 dnP[1] 0 0
VupP0 upP[0] 0 0
VdnP0 dnP[0] 0 0
VupN8 upN[8] 0 0
VdnN8 dnN[8] 0 PWL(0 0 1.18u 0 1.2u 3.3)
VupN7 upN[7] 0 0
VdnN7 dnN[7] 0 0
VupN6 upN[6] 0 PWL(0 0 1.98u 0 2u 3.3)
VdnN6 dnN[6] 0 0
VupN5 upN[5] 0 0
VdnN5 dnN[5] 0 0
VupN4 upN[4] 0 0
VdnN4 dnN[4] 0 0
VupN3 upN[3] 0 0
VdnN3 dnN[3] 0 0
VupN2 upN[2] 0 0
VdnN2 dnN[2] 0 0
VupN1 upN[1] 0 0
VdnN1 dnN[1] 0 0
VupN0 upN[0] 0 0
VdnN0 dnN[0] 0 0
.control
tran 0.5n 3u uic
let vdiff = v(topp)-v(topn)
let cm    = (v(topp)+v(topn))/2
write cdac_tb.raw tran1.all
meas tran vdiff_smp find vdiff at=0.9u
meas tran vdiff_msb find vdiff at=1.8u
meas tran vdiff_b6  find vdiff at=2.8u
meas tran cm_smp find cm at=0.9u
meas tran cm_msb find cm at=1.8u
meas tran cm_b6  find cm at=2.8u
print vdiff_smp vdiff_msb vdiff_b6 cm_smp cm_msb cm_b6
.endc
"}
C {title.sym} 190 -40 0 0 {name=l1 author="Gilang Fajrul Falah"}
C {cdac.sym} 1130 -510 0 0 {name=x1}
C {lab_pin.sym} 980 -600 0 0 {name=p1 sig_type=std_logic lab=dnN[8:0]}
C {lab_pin.sym} 980 -580 0 0 {name=p2 sig_type=std_logic lab=upN[8:0]}
C {lab_pin.sym} 980 -560 0 0 {name=p3 sig_type=std_logic lab=dnP[8:0]}
C {lab_pin.sym} 980 -540 0 0 {name=p4 sig_type=std_logic lab=upP[8:0]}
C {lab_pin.sym} 980 -520 0 0 {name=p5 sig_type=std_logic lab=vrefn}
C {lab_pin.sym} 980 -500 0 0 {name=p6 sig_type=std_logic lab=vcm}
C {lab_pin.sym} 980 -480 0 0 {name=p7 sig_type=std_logic lab=vrefp}
C {lab_pin.sym} 980 -460 0 0 {name=p8 sig_type=std_logic lab=sample}
C {lab_pin.sym} 980 -440 0 0 {name=p9 sig_type=std_logic lab=vinn}
C {lab_pin.sym} 980 -420 0 0 {name=p10 sig_type=std_logic lab=vinp}
C {lab_pin.sym} 1280 -580 0 1 {name=p11 sig_type=std_logic lab=topp}
C {lab_pin.sym} 1280 -600 0 1 {name=p12 sig_type=std_logic lab=topn}
C {lab_pin.sym} 1280 -560 0 1 {name=p13 sig_type=std_logic lab=vss}

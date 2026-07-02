v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 20 10 60 10 {lab=Y}
N -40 -40 -40 60 {lab=#net1}
N -150 -0 -40 -0 {lab=#net1}
N -100 -60 -100 -30 {lab=0}
N 20 -10 20 30 {lab=Y}
N -40 60 -20 60 {lab=#net1}
N -40 -40 -20 -40 {lab=#net1}
N -160 80 -160 120 {lab=0}
N -160 0 -160 20 {lab=#net1}
N -160 -0 -150 -0 {lab=#net1}
N 20 -120 20 -70 {lab=#net2}
N -100 -120 20 -120 {lab=#net2}
N 20 -40 60 -40 {lab=#net2}
N 60 -100 60 -40 {lab=#net2}
N 20 -100 60 -100 {lab=#net2}
N 20 90 20 130 {lab=0}
N 20 60 60 60 {lab=0}
N 60 60 60 100 {lab=0}
N 20 100 60 100 {lab=0}
C {symbols/nfet_03v3.sym} 0 60 0 0 {name=M1
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 0 -40 0 0 {name=M2
L=0.28u
W=0.22u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {gnd.sym} 20 130 0 0 {name=l2 lab=0}
C {opin.sym} 60 10 0 0 {name=p2 lab=Y}
C {vsource.sym} -100 -90 0 0 {name=V1 value=3.3 savecurrent=false}
C {vsource.sym} -160 50 0 0 {name=V2 value= "PULSE(0 3.3 1n 100p 100p 5n 10n)" savecurrent=false}
C {gnd.sym} -100 -30 0 0 {name=l4 lab=0}
C {gnd.sym} -160 120 0 0 {name=l5 lab=0}
C {code_shown.sym} -280 190 0 0 {name=s1 only_toplevel=false 
value=
"
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.tran 10p 50n
.save v(net1) v(Y)"}

v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -130 -100 -130 10 {lab=#net1}
N 50 -100 50 10 {lab=#net2}
N -130 70 -130 100 {lab=#net3}
N -130 100 50 100 {lab=#net3}
N 50 70 50 100 {lab=#net3}
N -40 100 -40 160 {lab=#net3}
N 820 -100 820 10 {lab=#net4}
N 1000 -100 1000 10 {lab=#net5}
N 820 70 820 100 {lab=#net6}
N 820 100 1000 100 {lab=#net6}
N 1000 70 1000 100 {lab=#net6}
N 920 100 920 160 {lab=#net6}
N -40 220 -40 250 {lab=Vss}
N -40 250 800 250 {lab=Vss}
N 920 220 920 250 {lab=Vss}
N 220 220 220 250 {lab=Vss}
N 440 220 440 250 {lab=Vss}
N -170 250 -40 250 {lab=Vss}
N 800 250 920 250 {lab=Vss}
N -130 -150 -130 -100 {lab=#net1}
N 50 -150 50 -100 {lab=#net2}
N 820 -150 820 -100 {lab=#net4}
N 1000 -150 1000 -100 {lab=#net5}
N 580 10 580 60 {lab=#net7}
N 580 40 780 40 {lab=#net7}
N 440 -80 440 160 {lab=Voutm}
N 220 -0 220 160 {lab=Voutp}
N 180 130 220 130 {lab=Voutp}
N 220 130 650 130 {lab=Voutp}
N 580 120 580 130 {lab=Voutp}
N 440 -50 580 -50 {lab=Voutm}
N 580 -50 640 -50 {lab=Voutm}
N -260 -260 1000 -260 {lab=Vdd}
N 860 -180 860 -130 {lab=#net4}
N 820 -130 860 -130 {lab=#net4}
N 960 -180 960 -130 {lab=#net5}
N 960 -130 1000 -130 {lab=#net5}
N 1000 -260 1000 -210 {lab=Vdd}
N 820 -260 820 -210 {lab=Vdd}
N 790 -180 820 -180 {lab=Vdd}
N 790 -260 790 -180 {lab=Vdd}
N 1000 -180 1040 -180 {lab=Vdd}
N 1040 -260 1040 -180 {lab=Vdd}
N 1000 -260 1040 -260 {lab=Vdd}
N 440 -260 440 -140 {lab=Vdd}
N 440 -110 490 -110 {lab=Vdd}
N 220 -260 220 -60 {lab=Vdd}
N 50 -260 50 -210 {lab=Vdd}
N -130 -260 -130 -210 {lab=Vdd}
N -90 -180 10 -180 {lab=#net4}
N -40 -230 -40 -180 {lab=#net4}
N -40 -230 720 -230 {lab=#net4}
N 720 -230 720 -80 {lab=#net4}
N 720 -80 820 -80 {lab=#net4}
N 20 40 50 40 {lab=Vss}
N -130 40 -100 40 {lab=Vss}
N 90 40 90 120 {lab=Vinm}
N -260 120 90 120 {lab=Vinm}
N -260 40 -170 40 {lab=Vinp}
N -40 190 -20 190 {lab=Vss}
N -20 190 -20 250 {lab=Vss}
N 220 190 250 190 {lab=Vss}
N 250 190 250 250 {lab=Vss}
N 440 190 470 190 {lab=Vss}
N 470 190 470 250 {lab=Vss}
N 920 190 950 190 {lab=Vss}
N 950 190 950 250 {lab=Vss}
N 920 250 950 250 {lab=Vss}
N 840 190 880 190 {lab=Vb}
N 370 190 400 190 {lab=Vb}
N 140 190 180 190 {lab=Vb}
N -130 190 -80 190 {lab=Vb}
N 150 120 150 130 {lab=Voutp}
N 150 130 180 130 {lab=Voutp}
N 150 40 150 60 {lab=#net8}
N -130 -30 180 -30 {lab=#net1}
N 150 -30 150 -20 {lab=#net1}
N 50 -110 400 -110 {lab=#net2}
N 360 -110 360 -50 {lab=#net2}
N 360 10 360 40 {lab=#net9}
N 360 100 440 100 {lab=Voutm}
N -260 250 -170 250 {lab=Vss}
N 1040 40 1080 40 {lab=Vcm}
N 50 -180 80 -180 {lab=Vdd}
N 80 -260 80 -180 {lab=Vdd}
N -160 -180 -130 -180 {lab=Vdd}
N -160 -260 -160 -180 {lab=Vdd}
N 820 40 850 40 {lab=Vss}
N 220 -30 240 -30 {lab=Vdd}
N 970 40 1000 40 {lab=Vss}
N 950 250 1090 250 {lab=Vss}
N 1040 -260 1090 -260 {lab=Vdd}
C {symbols/nfet_03v3.sym} -150 40 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 70 40 0 1 {name=M2
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
C {symbols/pfet_03v3.sym} -110 -180 0 1 {name=M3
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
C {symbols/pfet_03v3.sym} 30 -180 0 0 {name=M4
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
C {symbols/nfet_03v3.sym} -60 190 0 0 {name=M0
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
C {symbols/nfet_03v3.sym} 200 190 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} 420 190 0 0 {name=M6
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
C {symbols/pfet_03v3.sym} 200 -30 0 0 {name=M7
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
C {symbols/pfet_03v3.sym} 420 -110 0 0 {name=M8
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
C {symbols/nfet_03v3.sym} 900 190 0 0 {name=M9
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
C {symbols/nfet_03v3.sym} 800 40 0 0 {name=M10
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
C {symbols/nfet_03v3.sym} 1020 40 0 1 {name=M11
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
C {symbols/pfet_03v3.sym} 840 -180 0 1 {name=M12
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
C {symbols/pfet_03v3.sym} 980 -180 0 0 {name=M13
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
C {res.sym} 150 90 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 360 70 0 0 {name=R2
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 580 -20 0 0 {name=R3
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 580 90 0 0 {name=R4
value=1k
footprint=1206
device=resistor
m=1}
C {symbols/cap_mim_2f0fF.sym} 150 10 0 0 {name=C1
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 360 -20 0 0 {name=C2
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {ipin.sym} -430 -60 0 0 {name=p1 lab=Vinp
}
C {ipin.sym} -430 -30 0 0 {name=p2 lab=Vinm}
C {ipin.sym} -130 190 0 0 {name=p5 lab=Vb
}
C {iopin.sym} 130 -370 0 0 {name=p3 lab=Vdd
}
C {iopin.sym} 130 -350 0 0 {name=p4 lab=Vss}
C {lab_wire.sym} -260 -260 0 0 {name=p6 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 490 -110 0 1 {name=p7 sig_type=std_logic lab=Vdd}
C {lab_wire.sym} 140 190 0 0 {name=p8 sig_type=std_logic lab=Vb}
C {lab_wire.sym} 370 190 0 0 {name=p9 sig_type=std_logic lab=Vb}
C {lab_wire.sym} 840 190 0 0 {name=p10 sig_type=std_logic lab=Vb}
C {lab_wire.sym} -260 250 0 0 {name=p11 sig_type=std_logic lab=Vss
}
C {lab_wire.sym} -100 40 0 1 {name=p12 sig_type=std_logic lab=Vss
}
C {lab_wire.sym} 20 40 0 0 {name=p13 sig_type=std_logic lab=Vss
}
C {lab_wire.sym} 850 40 0 1 {name=p14 sig_type=std_logic lab=Vss
}
C {lab_wire.sym} 970 40 0 0 {name=p15 sig_type=std_logic lab=Vss
}
C {lab_wire.sym} 240 -30 0 1 {name=p16 sig_type=std_logic lab=Vdd}
C {ipin.sym} -430 0 0 0 {name=p17 lab=Vcm}
C {opin.sym} 1230 -60 0 0 {name=p18 lab=Voutm}
C {opin.sym} 1230 -30 0 0 {name=p19 lab=Voutp}
C {lab_wire.sym} 640 -50 0 1 {name=p20 sig_type=std_logic lab=Voutm}
C {lab_wire.sym} 650 130 0 1 {name=p21 sig_type=std_logic lab=Voutp}
C {lab_wire.sym} 1080 40 0 1 {name=p22 sig_type=std_logic lab=Vcm}
C {lab_wire.sym} -260 40 0 0 {name=p24 sig_type=std_logic lab=Vinp
}
C {lab_wire.sym} -260 120 0 0 {name=p25 sig_type=std_logic lab=Vinm
}

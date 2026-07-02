v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 170 -560 170 -540 {lab=vdd}
N 170 -560 1090 -560 {lab=vdd}
N 1090 -560 1090 -540 {lab=vdd}
N 950 -560 950 -540 {lab=vdd}
N 740 -560 740 -540 {lab=vdd}
N 310 -560 310 -540 {lab=vdd}
N 520 -560 520 -540 {lab=vdd}
N 520 -480 520 -420 {lab=X}
N 740 -480 740 -420 {lab=Y}
N 740 -360 740 -320 {lab=Q}
N 520 -360 520 -320 {lab=P}
N 520 -260 520 -240 {lab=#net1}
N 520 -240 740 -240 {lab=#net1}
N 740 -260 740 -240 {lab=#net1}
N 620 -240 620 -220 {lab=#net1}
N 310 -480 310 -460 {lab=X}
N 310 -450 520 -450 {lab=X}
N 310 -460 310 -450 {lab=X}
N 170 -480 170 -340 {lab=P}
N 170 -340 520 -340 {lab=P}
N 950 -480 950 -450 {lab=Y}
N 740 -450 950 -450 {lab=Y}
N 1090 -480 1090 -340 {lab=Q}
N 740 -340 1090 -340 {lab=Q}
N 560 -510 600 -510 {lab=Y}
N 660 -510 700 -510 {lab=X}
N 560 -390 600 -390 {lab=Y}
N 660 -390 700 -390 {lab=X}
N 600 -470 660 -510 {lab=X}
N 520 -470 600 -470 {lab=X}
N 600 -510 660 -470 {lab=Y}
N 660 -470 740 -470 {lab=Y}
N 600 -430 660 -390 {lab=X}
N 520 -430 600 -430 {lab=X}
N 600 -390 660 -430 {lab=Y}
N 660 -430 740 -430 {lab=Y}
N 130 -560 170 -560 {lab=vdd}
N 620 -160 620 -140 {lab=vss}
N 130 -140 620 -140 {lab=vss}
N 620 -140 1130 -140 {lab=vss}
N 170 -510 180 -510 {lab=vdd}
N 180 -560 180 -510 {lab=vdd}
N 310 -510 320 -510 {lab=vdd}
N 320 -560 320 -510 {lab=vdd}
N 510 -510 520 -510 {lab=vdd}
N 510 -560 510 -510 {lab=vdd}
N 740 -510 750 -510 {lab=vdd}
N 750 -560 750 -510 {lab=vdd}
N 940 -510 950 -510 {lab=vdd}
N 940 -560 940 -510 {lab=vdd}
N 1080 -510 1090 -510 {lab=vdd}
N 1080 -560 1080 -510 {lab=vdd}
N 620 -190 630 -190 {lab=vss}
N 630 -190 630 -140 {lab=vss}
N 520 -290 630 -290 {lab=vss}
N 630 -290 740 -290 {lab=vss}
N 740 -390 770 -390 {lab=vss}
N 490 -390 520 -390 {lab=vss}
N 570 -190 580 -190 {lab=clk}
N 120 -510 130 -510 {lab=clk}
N 260 -510 270 -510 {lab=clk}
N 990 -510 1000 -510 {lab=clk}
N 1130 -510 1140 -510 {lab=clk}
N 780 -290 800 -290 {lab=vin2}
N 460 -290 480 -290 {lab=vin1}
C {symbols/nfet_03v3.sym} 500 -290 0 0 {name=M1
L=0.5u
W=4u
nf=4
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
C {symbols/nfet_03v3.sym} 760 -290 0 1 {name=M2
L=0.5u
W=4u
nf=4
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
C {symbols/nfet_03v3.sym} 540 -390 0 1 {name=M3
L=0.28u
W=2u
nf=2
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
C {symbols/nfet_03v3.sym} 720 -390 0 0 {name=M4
L=0.28u
W=2u
nf=2
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
C {symbols/pfet_03v3.sym} 540 -510 0 1 {name=M5
L=0.28u
W=6u
nf=2
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
C {symbols/pfet_03v3.sym} 720 -510 0 0 {name=M6
L=0.28u
W=6u
nf=2
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
C {symbols/nfet_03v3.sym} 600 -190 0 0 {name=M7
L=0.28u
W=6u
nf=4
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
C {symbols/pfet_03v3.sym} 290 -510 0 0 {name=M8
L=0.28u
W=2u
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
C {symbols/pfet_03v3.sym} 150 -510 0 0 {name=M9
L=0.28u
W=2u
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
C {symbols/pfet_03v3.sym} 970 -510 0 1 {name=M10
L=0.28u
W=2u
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
C {symbols/pfet_03v3.sym} 1110 -510 0 1 {name=M11
L=0.28u
W=2u
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
C {lab_pin.sym} 130 -560 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 130 -140 0 0 {name=p2 sig_type=std_logic lab=vss}
C {lab_pin.sym} 490 -390 0 0 {name=p3 sig_type=std_logic lab=vss}
C {lab_pin.sym} 770 -390 0 1 {name=p4 sig_type=std_logic lab=vss}
C {lab_pin.sym} 630 -290 3 1 {name=p5 sig_type=std_logic lab=vss}
C {lab_pin.sym} 120 -510 0 0 {name=p7 sig_type=std_logic lab=clk}
C {lab_pin.sym} 260 -510 0 0 {name=p6 sig_type=std_logic lab=clk}
C {lab_pin.sym} 1000 -510 0 1 {name=p8 sig_type=std_logic lab=clk}
C {lab_pin.sym} 1140 -510 0 1 {name=p9 sig_type=std_logic lab=clk}
C {lab_pin.sym} 570 -190 0 0 {name=p10 sig_type=std_logic lab=clk}
C {lab_pin.sym} 460 -290 0 0 {name=p11 sig_type=std_logic lab=vin1}
C {lab_pin.sym} 800 -290 0 1 {name=p12 sig_type=std_logic lab=vin2}
C {lab_pin.sym} 950 -450 0 1 {name=p13 sig_type=std_logic lab=Y}
C {lab_pin.sym} 310 -450 0 0 {name=p14 sig_type=std_logic lab=X}
C {lab_pin.sym} 880 -340 1 1 {name=p15 sig_type=std_logic lab=Q}
C {lab_pin.sym} 400 -340 1 1 {name=p16 sig_type=std_logic lab=P}
C {iopin.sym} 610 -620 0 0 {name=p17 lab=vdd}
C {iopin.sym} 610 -600 0 0 {name=p18 lab=vss}
C {ipin.sym} 100 -390 0 0 {name=p19 lab=vin1}
C {ipin.sym} 100 -370 0 0 {name=p20 lab=vin2}
C {ipin.sym} 100 -350 0 0 {name=p21 lab=clk}
C {opin.sym} 1190 -390 0 0 {name=p22 lab=X}
C {opin.sym} 1190 -370 0 0 {name=p23 lab=Y}
C {title.sym} 170 -40 0 0 {name=l1 author="Gilang Fajrul Falah"}

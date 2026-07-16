v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 400 -810 530 -810 {lab=#net1}
N 360 -470 360 -440 {lab=#net2}
N 360 -440 570 -440 {lab=#net2}
N 570 -470 570 -440 {lab=#net2}
N 460 -440 460 -360 {lab=#net2}
N 570 -780 570 -530 {lab=#net3}
N 360 -780 360 -530 {lab=#net4}
N 360 -640 720 -640 {lab=#net4}
N 570 -730 910 -730 {lab=#net3}
N 760 -610 760 -360 {lab=Voutp}
N 950 -700 950 -360 {lab=Voutm}
N 360 -890 360 -840 {lab=Vdd}
N 360 -890 950 -890 {lab=Vdd}
N 950 -890 950 -760 {lab=Vdd}
N 570 -890 570 -840 {lab=Vdd}
N 760 -890 760 -670 {lab=Vdd}
N 180 -890 360 -890 {lab=Vdd}
N 950 -890 1090 -890 {lab=Vdd}
N 160 -260 1070 -260 {lab=Vss}
N 460 -300 460 -260 {lab=Vss}
N 760 -300 760 -260 {lab=Vss}
N 950 -300 950 -260 {lab=Vss}
N 460 -330 480 -330 {lab=Vss}
N 480 -330 480 -260 {lab=Vss}
N 760 -330 780 -330 {lab=Vss}
N 780 -330 780 -260 {lab=Vss}
N 950 -330 970 -330 {lab=Vss}
N 970 -330 970 -260 {lab=Vss}
N 890 -330 910 -330 {lab=Vb}
N 700 -330 720 -330 {lab=Vb}
N 400 -330 420 -330 {lab=Vb}
N 280 -500 320 -500 {lab=Vinp}
N 610 -500 610 -400 {lab=Vdd}
N 280 -400 610 -400 {lab=Vdd}
N 360 -500 400 -500 {lab=Vss}
N 520 -500 570 -500 {lab=Vss}
N 320 -810 360 -810 {lab=Vdd}
N 320 -890 320 -810 {lab=Vdd}
N 570 -810 600 -810 {lab=Vdd}
N 600 -890 600 -810 {lab=Vdd}
N 760 -640 800 -640 {lab=Vdd}
N 950 -730 980 -730 {lab=Vdd}
N 690 -640 690 -610 {lab=#net4}
N 690 -550 690 -520 {lab=#net5}
N 690 -460 690 -440 {lab=Voutp}
N 690 -440 760 -440 {lab=Voutp}
N 900 -730 900 -700 {lab=#net3}
N 900 -640 900 -610 {lab=#net6}
N 900 -550 900 -530 {lab=Voutm}
N 900 -530 950 -530 {lab=Voutm}
N 950 -620 1090 -620 {lab=Voutm}
N 760 -440 1090 -440 {lab=Voutp}
C {symbols/pfet_03v3.sym} 380 -810 0 1 {name=M3
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
C {symbols/pfet_03v3.sym} 550 -810 0 0 {name=M4
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
C {symbols/pfet_03v3.sym} 740 -640 0 0 {name=M7
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
C {symbols/pfet_03v3.sym} 930 -730 0 0 {name=M8
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
C {symbols/nfet_03v3.sym} 590 -500 0 1 {name=M2
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
C {symbols/nfet_03v3.sym} 340 -500 0 0 {name=M1
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
C {symbols/nfet_03v3.sym} 440 -330 0 0 {name=M0
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
C {symbols/nfet_03v3.sym} 740 -330 0 0 {name=M5
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
C {symbols/nfet_03v3.sym} 930 -330 0 0 {name=M6
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
C {symbols/cap_mim_2f0fF.sym} 690 -580 0 0 {name=C1
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/cap_mim_2f0fF.sym} 900 -670 0 0 {name=C2
W=1e-6
L=1e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {res.sym} 690 -490 0 0 {name=R0
value=1k
footprint=1206
device=resistor
m=1}
C {res.sym} 900 -580 0 0 {name=R1
value=1k
footprint=1206
device=resistor
m=1}
C {iopin.sym} 130 -670 2 0 {name=p1 lab=Vdd}
C {iopin.sym} 130 -650 2 0 {name=p2 lab=Vss}
C {ipin.sym} 130 -620 0 0 {name=p3 lab=Vinp}
C {ipin.sym} 130 -600 0 0 {name=p4 lab=Vinm}
C {ipin.sym} 130 -580 0 0 {name=p5 lab=Vb}
C {lab_pin.sym} 180 -890 0 0 {name=p6 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} 800 -640 2 0 {name=p7 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} 980 -730 2 0 {name=p8 sig_type=std_logic lab=Vdd
}
C {lab_pin.sym} 160 -260 0 0 {name=p9 sig_type=std_logic lab=Vss

}
C {lab_pin.sym} 520 -500 0 0 {name=p10 sig_type=std_logic lab=Vss

}
C {lab_pin.sym} 400 -500 2 0 {name=p11 sig_type=std_logic lab=Vss

}
C {lab_pin.sym} 400 -330 0 0 {name=p12 sig_type=std_logic lab=Vb

}
C {lab_pin.sym} 700 -330 0 0 {name=p13 sig_type=std_logic lab=Vb

}
C {lab_pin.sym} 890 -330 0 0 {name=p14 sig_type=std_logic lab=Vb

}
C {opin.sym} 1190 -700 0 0 {name=p15 lab=Voutp}
C {opin.sym} 1190 -680 0 0 {name=p16 lab=Voutm}
C {lab_pin.sym} 1090 -620 2 0 {name=p17 sig_type=std_logic lab=Voutm
}
C {lab_pin.sym} 1090 -440 2 0 {name=p18 sig_type=std_logic lab=Voutp
}
C {lab_pin.sym} 280 -500 0 0 {name=p19 sig_type=std_logic lab=Vinp
}
C {lab_pin.sym} 280 -400 0 0 {name=p20 sig_type=std_logic lab=Vinm
}

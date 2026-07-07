v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 800 -400 840 -400 {lab=vin}
N 750 -570 790 -570 {lab=ng}
N 460 -570 650 -570 {lab=ct}
N 360 -570 460 -570 {lab=ct}
N 460 -510 460 -370 {lab=gp}
N 650 -570 650 -500 {lab=ct}
N 650 -440 650 -370 {lab=cb}
N 330 -530 330 -440 {lab=gp}
N 330 -440 460 -440 {lab=gp}
N 650 -570 690 -570 {lab=ct}
N 770 -570 770 -440 {lab=ng}
N 770 -440 870 -440 {lab=ng}
N 650 -400 740 -400 {lab=cb}
N 820 -570 850 -570 {lab=vss}
N 720 -570 750 -570 {lab=ng}
N 870 -400 870 -390 {lab=vss}
N 770 -400 770 -390 {lab=vss}
N 650 -340 650 -310 {lab=vss}
N 460 -340 460 -310 {lab=vss}
N 410 -340 420 -340 {lab=ckb}
N 290 -570 300 -570 {lab=vdd}
N 460 -570 460 -540 {lab=ct}
N 300 -570 330 -570 {lab=vdd}
C {symbols/pfet_06v0.sym} 330 -550 3 0 {name=Mp1
L=0.6u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X}
C {lab_pin.sym} 330 -440 0 0 {name=l_Mp1_G lab=gp}
C {lab_pin.sym} 290 -570 0 0 {name=l_Mp1_S lab=vdd}
C {symbols/nfet_06v0.sym} 440 -340 0 0 {name=Mnb
L=0.6u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X}
C {lab_pin.sym} 410 -340 0 0 {name=l_Mnb_G lab=ckb}
C {lab_pin.sym} 460 -310 0 0 {name=l_Mnb_S lab=vss}
C {symbols/pfet_06v0.sym} 440 -540 0 0 {name=Mpc
L=0.6u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X}
C {lab_pin.sym} 420 -540 0 0 {name=l_Mpc_G lab=ckb}
C {lab_pin.sym} 500 -570 1 0 {name=l_Mpc_S lab=ct}
C {symbols/nfet_06v0.sym} 630 -340 0 0 {name=Mn1
L=0.6u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X}
C {lab_pin.sym} 610 -340 0 0 {name=l_Mn1_G lab=ckb}
C {lab_pin.sym} 650 -310 0 0 {name=l_Mn1_S lab=vss}
C {symbols/nfet_06v0.sym} 820 -590 3 1 {name=Mn2
L=0.6u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X}
C {lab_pin.sym} 820 -610 3 1 {name=l_Mn2_G lab=ckb}
C {lab_pin.sym} 850 -570 0 1 {name=l_Mn2_S lab=vss}
C {symbols/pfet_06v0.sym} 720 -590 1 0 {name=Mp2
L=0.6u
W=8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_06v0
spiceprefix=X}
C {lab_pin.sym} 720 -610 1 0 {name=l_Mp2_G lab=ckb}
C {symbols/nfet_06v0.sym} 770 -420 3 1 {name=Mn3
L=0.6u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X}
C {lab_pin.sym} 770 -490 0 1 {name=l_Mn3_G lab=ng}
C {lab_pin.sym} 770 -390 1 1 {name=l_Mn3_B lab=vss}
C {symbols/nfet_06v0.sym} 870 -420 3 1 {name=Msw
L=0.6u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_06v0
spiceprefix=X}
C {lab_pin.sym} 820 -400 1 1 {name=l_Msw_D lab=vin}
C {lab_pin.sym} 900 -400 0 1 {name=l_Msw_S lab=vout}
C {lab_pin.sym} 870 -390 1 1 {name=l_Msw_B lab=vss}
C {symbols/cap_mim_2f0fF.sym} 650 -470 2 0 {name=Cb
W=44.72u
L=44.72u
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {lab_pin.sym} 650 -430 2 0 {name=l_Cb_b lab=cb}
C {ipin.sym} 80 -200 0 0 {name=p_vin lab=vin}
C {opin.sym} 80 -240 0 0 {name=p_vout lab=vout}
C {ipin.sym} 80 -280 0 0 {name=p_ck lab=ck}
C {ipin.sym} 80 -320 0 0 {name=p_ckb lab=ckb}
C {iopin.sym} 80 -360 0 0 {name=p_vdd lab=vdd}
C {iopin.sym} 80 -400 0 0 {name=p_vss lab=vss}
C {code_shown.sym} 30 -130 0 0 {name=INFO only_toplevel=false value="* Bootstrapped sampling switch v(b) 6V devices; Cb=4pF; Vgs~2.9V flat 1.3%"}
C {title.sym} 190 -60 0 0 {name=l1 author="Gilang Fajrul Falah"}

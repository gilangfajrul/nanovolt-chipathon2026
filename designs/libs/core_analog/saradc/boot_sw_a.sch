v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {symbols/pfet_03v3.sym} 200 -200 0 0 {name=Mp1
L=0.6u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X}
C {lab_pin.sym} 220 -170 0 0 {name=l_Mp1_D lab=ct}
C {lab_pin.sym} 180 -200 0 0 {name=l_Mp1_G lab=gp}
C {lab_pin.sym} 220 -230 0 0 {name=l_Mp1_S lab=vdd}
C {lab_pin.sym} 220 -200 0 0 {name=l_Mp1_B lab=vdd}
C {symbols/nfet_03v3.sym} 460 -200 0 0 {name=Mnb
L=0.6u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 480 -230 0 0 {name=l_Mnb_D lab=gp}
C {lab_pin.sym} 440 -200 0 0 {name=l_Mnb_G lab=ckb}
C {lab_pin.sym} 480 -170 0 0 {name=l_Mnb_S lab=vss}
C {lab_pin.sym} 480 -200 0 0 {name=l_Mnb_B lab=vss}
C {symbols/pfet_03v3.sym} 720 -200 0 0 {name=Mpc
L=0.6u
W=2u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X}
C {lab_pin.sym} 740 -170 0 0 {name=l_Mpc_D lab=gp}
C {lab_pin.sym} 700 -200 0 0 {name=l_Mpc_G lab=ckb}
C {lab_pin.sym} 740 -230 0 0 {name=l_Mpc_S lab=ct}
C {lab_pin.sym} 740 -200 0 0 {name=l_Mpc_B lab=ct}
C {symbols/nfet_03v3.sym} 980 -200 0 0 {name=Mn2a
L=0.6u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 1000 -230 0 0 {name=l_Mn2a_D lab=ng}
C {lab_pin.sym} 960 -200 0 0 {name=l_Mn2a_G lab=vdd}
C {lab_pin.sym} 1000 -170 0 0 {name=l_Mn2a_S lab=nmid}
C {lab_pin.sym} 1000 -200 0 0 {name=l_Mn2a_B lab=vss}
C {symbols/nfet_03v3.sym} 200 60 0 0 {name=Mn2b
L=0.6u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 220 30 0 0 {name=l_Mn2b_D lab=nmid}
C {lab_pin.sym} 180 60 0 0 {name=l_Mn2b_G lab=ckb}
C {lab_pin.sym} 220 90 0 0 {name=l_Mn2b_S lab=vss}
C {lab_pin.sym} 220 60 0 0 {name=l_Mn2b_B lab=vss}
C {symbols/pfet_03v3.sym} 460 60 0 0 {name=Mn2c
L=0.6u
W=3u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X}
C {lab_pin.sym} 480 90 0 0 {name=l_Mn2c_D lab=nmid}
C {lab_pin.sym} 440 60 0 0 {name=l_Mn2c_G lab=ckb}
C {lab_pin.sym} 480 30 0 0 {name=l_Mn2c_S lab=vdd}
C {lab_pin.sym} 480 60 0 0 {name=l_Mn2c_B lab=vdd}
C {symbols/nfet_03v3.sym} 720 60 0 0 {name=Mn1
L=0.6u
W=5u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 740 30 0 0 {name=l_Mn1_D lab=cb}
C {lab_pin.sym} 700 60 0 0 {name=l_Mn1_G lab=ckb}
C {lab_pin.sym} 740 90 0 0 {name=l_Mn1_S lab=vss}
C {lab_pin.sym} 740 60 0 0 {name=l_Mn1_B lab=vss}
C {symbols/pfet_03v3.sym} 980 60 0 0 {name=Mp2
L=0.6u
W=8u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X}
C {lab_pin.sym} 1000 90 0 0 {name=l_Mp2_D lab=ct}
C {lab_pin.sym} 960 60 0 0 {name=l_Mp2_G lab=ckb}
C {lab_pin.sym} 1000 30 0 0 {name=l_Mp2_S lab=ng}
C {lab_pin.sym} 1000 60 0 0 {name=l_Mp2_B lab=ng}
C {symbols/nfet_03v3.sym} 200 320 0 0 {name=Mn3
L=0.6u
W=10u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 220 290 0 0 {name=l_Mn3_D lab=cb}
C {lab_pin.sym} 180 320 0 0 {name=l_Mn3_G lab=ng}
C {lab_pin.sym} 220 350 0 0 {name=l_Mn3_S lab=vin}
C {lab_pin.sym} 220 320 0 0 {name=l_Mn3_B lab=vss}
C {symbols/nfet_03v3.sym} 460 320 0 0 {name=Msw
L=0.6u
W=40u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'" as="'int((nf+2)/2) * W/nf * 0.18u'" pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'" ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'" nrd="'0.18u / W'" nrs="'0.18u / W'" sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {lab_pin.sym} 480 290 0 0 {name=l_Msw_D lab=vin}
C {lab_pin.sym} 440 320 0 0 {name=l_Msw_G lab=ng}
C {lab_pin.sym} 480 350 0 0 {name=l_Msw_S lab=vout}
C {lab_pin.sym} 480 320 0 0 {name=l_Msw_B lab=vss}
C {symbols/cap_mim_2f0fF.sym} 200 580 0 0 {name=Cb
W=31.62u
L=31.62u
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {lab_pin.sym} 200 610 0 0 {name=l_Cb_t lab=ct}
C {lab_pin.sym} 200 550 0 0 {name=l_Cb_b lab=cb}
C {ipin.sym} -200 -100 0 0 {name=p_vin lab=vin}
C {opin.sym} -200 -140 0 0 {name=p_vout lab=vout}
C {ipin.sym} -200 -180 0 0 {name=p_ck lab=ck}
C {ipin.sym} -200 -220 0 0 {name=p_ckb lab=ckb}
C {iopin.sym} -200 -260 0 0 {name=p_vdd lab=vdd}
C {iopin.sym} -200 -300 0 0 {name=p_vss lab=vss}
C {code_shown.sym} -200 80 0 0 {name=INFO only_toplevel=false value="* Bootstrap v(a) 3.3V + cascode (cmp study); Cb=2pF; Vgs non-flat, peak 4.17V (still >3.3)"}
C {title.sym} 200 80 0 0 {name=l1 author="Gilang Fajrul Falah"}

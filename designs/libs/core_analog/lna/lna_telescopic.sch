v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 270 -290 270 -210 {
lab=vo1}
N 490 -290 490 -210 {
lab=vo2}
N 270 -150 270 -120 {
lab=#net1}
N 270 -20 350 -20 {
lab=vtail}
N 490 -150 490 -120 {
lab=#net2}
N 140 20 200 20 {
lab=ibn}
N 200 20 200 70 {
lab=ibn}
N 140 100 140 120 {
lab=VSS}
N 380 100 380 120 {
lab=VSS}
N 270 -460 270 -440 {
lab=VDD}
N 490 -460 490 -440 {
lab=VDD}
N 140 120 140 140 {
lab=VSS}
N 380 120 380 140 {
lab=VSS}
N 150 -480 430 -480 {
lab=VDD}
N 490 -480 490 -460 {
lab=VDD}
N 270 -480 270 -460 {
lab=VDD}
N 270 -180 280 -180 {
lab=VSS}
N 480 -180 490 -180 {
lab=VSS}
N 460 -20 490 -20 {
lab=vtail}
N 460 -480 490 -480 {
lab=VDD}
N 380 10 380 40 {
lab=vtail}
N 140 10 140 40 {
lab=ibn}
N 380 -20 380 10 {
lab=vtail}
N 100 140 120 140 {
lab=VSS}
N 140 -10 140 10 {
lab=ibn}
N 180 70 230 70 {
lab=ibn}
N 120 140 170 140 {
lab=VSS}
N 230 70 330 70 {
lab=ibn}
N 170 140 370 140 {
lab=VSS}
N 380 70 380 100 {
lab=VSS}
N 140 70 140 100 {
lab=VSS}
N 70 -480 150 -480 {
lab=VDD}
N 490 -250 540 -250 {
lab=vo2}
N 100 -40 140 -40 {lab=ibn}
N 140 -40 140 -10 {lab=ibn}
N 540 -250 580 -250 {lab=vo2}
N 430 -20 460 -20 {lab=vtail}
N 430 -480 460 -480 {lab=VDD}
N 330 70 340 70 {lab=ibn}
N 370 140 380 140 {lab=VSS}
N 370 -20 380 -20 {lab=vtail}
N 350 -20 370 -20 {lab=vtail}
N 380 -20 430 -20 {lab=vtail}
N 270 -370 270 -350 {
lab=#net3}
N 490 -370 490 -350 {
lab=#net4}
N 490 -390 490 -370 {
lab=#net4}
N 270 -390 270 -370 {
lab=#net3}
N 270 -70 270 -40 {
lab=vtail}
N 490 -70 490 -40 {
lab=vtail}
N 270 -100 280 -100 {
lab=VSS}
N 480 -100 490 -100 {
lab=VSS}
N 270 -40 270 -20 {lab=vtail}
N 490 -40 490 -20 {lab=vtail}
N 180 -250 230 -250 {
lab=vo1}
N 230 -250 270 -250 {lab=vo1}
N 410 -410 450 -410 {lab=vb3}
N 310 -320 450 -320 {lab=vo1}
N 270 -270 330 -270 {lab=vo1}
N 330 -320 330 -270 {lab=vo1}
N 430 -100 480 -100 {lab=VSS}
N 280 -100 340 -100 {lab=VSS}
N 340 -110 340 -100 {lab=VSS}
N 430 -110 430 -100 {lab=VSS}
N 430 -180 480 -180 {lab=VSS}
N 430 -200 430 -180 {lab=VSS}
N 280 -180 340 -180 {lab=VSS}
N 340 -200 340 -180 {lab=VSS}
N 340 -120 340 -110 {lab=VSS}
N 430 -120 430 -110 {lab=VSS}
N 400 -410 410 -410 {lab=vb3}
N 310 -410 350 -410 {lab=vb3}
N 350 -410 400 -410 {lab=vb3}
N 160 -180 230 -180 {lab=vb1}
N 160 -180 160 -50 {lab=vb1}
N 160 -50 620 -50 {lab=vb1}
N 620 -180 620 -50 {lab=vb1}
N 530 -180 620 -180 {lab=vb1}
N 110 -150 160 -150 {lab=vb1}
N 350 -380 380 -380 {lab=vb3}
N 380 -410 380 -380 {lab=vb3}
N 160 -320 270 -320 {lab=VDD}
N 160 -480 160 -320 {lab=VDD}
N 490 -320 600 -320 {lab=VDD}
N 600 -480 600 -320 {lab=VDD}
N 490 -480 600 -480 {lab=VDD}
N 230 -410 270 -410 {lab=VDD}
N 230 -480 230 -410 {lab=VDD}
N 480 -410 530 -410 {lab=VDD}
N 530 -480 530 -410 {lab=VDD}
N 470 -250 490 -250 {lab=vo2}
N 380 -250 410 -250 {lab=vo1}
N 350 -250 380 -250 {lab=vo1}
N 270 -250 290 -250 {lab=vo1}
N 380 -320 380 -250 {lab=vo1}
C {devices/ipin.sym} 110 -150 0 0 {name=p1 lab=vb1}
C {devices/opin.sym} 580 -250 0 0 {name=p3 lab=vo2
}
C {devices/iopin.sym} 70 -480 0 1 {name=p4 lab=VDD}
C {devices/iopin.sym} 100 140 2 0 {name=p5 lab=VSS}
C {devices/lab_wire.sym} 340 -200 0 1 {name=p7 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 430 -200 0 0 {name=p11 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 380 10 0 1 {name=p17 sig_type=std_logic lab=vtail}
C {symbols/pfet_03v3.sym} 470 -410 0 0 {name=M2b
L=0.6um
W=2um
nf=11
m=147
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 290 -410 0 1 {name=M2a
L=0.6um
W=2um
nf=11
m=147
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 250 -180 0 0 {name=M1a
L=0.28um
W=5um
nf=10
m=19
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 360 70 0 0 {name=M0b
L=0.5um
W=10um
nf=10
m=7
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 510 -180 0 1 {name=M1b
L=0.28um
W=5um
nf=10
m=19
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 160 70 0 1 {name=M0a
L=0.5um
W=5um
nf=10
m=7
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/iopin.sym} 100 -40 2 0 {name=p6 lab=ibn}
C {symbols/pfet_03v3.sym} 470 -320 0 0 {name=M1
L=0.6um
W=2um
nf=11
m=92
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} 290 -320 0 1 {name=M2
L=0.6um
W=2um
nf=11
m=92
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {devices/ipin.sym} 230 -100 0 0 {name=p8 lab=vin1}
C {devices/ipin.sym} 530 -100 0 1 {name=p9 lab=vin2}
C {devices/lab_wire.sym} 340 -120 0 1 {name=p10 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 430 -120 0 0 {name=p12 sig_type=std_logic lab=VSS}
C {symbols/nfet_03v3.sym} 250 -100 0 0 {name=M3
L=0.28um
W=5um
nf=10
m=81
ad=0
pd=0
as=0
ps=0 
nrd=0
nrs=0
rd=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 510 -100 0 1 {name=M4
L=0.28um
W=5um
nf=10
m=81
ad=0
pd=0
as=0
ps=0
nrd=0
nrs=0
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X}
C {devices/opin.sym} 180 -250 0 1 {name=p13 lab=vo1

}
C {devices/ipin.sym} 350 -380 0 0 {name=p2 lab=vb3}
C {res.sym} 320 -250 1 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} 440 -250 1 1 {name=R2
value=10k
footprint=1206
device=resistor
m=1}

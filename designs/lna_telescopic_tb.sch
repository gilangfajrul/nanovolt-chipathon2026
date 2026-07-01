v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 60 570 860 970 {flags=graph
y1=-43
y2=60
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-1.7496484
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
color=4
node="\\"vo db20()\\""

sim_type=ac
autoload=0
hilight_wave=-1
x2=9.0503516}
B 2 890 570 1690 970 {flags=graph
y1=-120
y2=30
ypos1=0
ypos2=2
divy=5
subdivy=4
unity=1
x1=-1.7496484
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=1
logy=0
color=5
node=ph(vo)

sim_type=ac
autoload=0
hilight_wave=-1
x2=9.0503516}
T {tcleval(A0: [to_eng [xschem raw value A0 0]]
GBW: [to_eng [xschem raw value GBW 0]]
UGF: [to_eng [xschem raw value ugf 0]]
PM: [to_eng [xschem raw value pm 0]]
)} 760 370 0 0 0.4 0.4 {floater=1}
N 260 350 300 350 {
lab=#net1}
N 80 300 80 460 {
lab=#net1}
N 80 300 260 300 {
lab=#net1}
N 80 520 80 540 {
lab=GND}
N 260 520 260 540 {
lab=GND}
N 260 440 340 440 {
lab=#net2}
N 260 440 260 460 {
lab=#net2}
N 260 390 300 390 {
lab=GND}
N 260 390 260 410 {
lab=GND}
N 180 400 180 440 {
lab=#net2}
N 340 400 340 440 {
lab=#net2}
N 260 300 260 350 {
lab=#net1}
N 340 260 340 340 {
lab=vin2}
N 180 260 180 340 {
lab=vin1}
N 180 440 260 440 {
lab=#net2}
N 220 390 260 390 {
lab=GND}
N 220 350 260 350 {
lab=#net1}
N 340 250 340 260 {lab=vin2}
N 180 170 270 170 {lab=vin1}
N 540 420 540 460 {
lab=VSS}
N 540 520 540 540 {
lab=GND}
N 620 420 620 460 {
lab=VDD}
N 620 520 620 540 {
lab=GND}
N 890 190 890 210 {lab=vo2}
N 890 210 890 230 {lab=vo2}
N 890 290 890 330 {lab=Vcm}
N 940 170 940 190 {lab=vo1}
N 940 190 940 210 {lab=vo1}
N 940 290 940 330 {lab=Vcm}
N 940 210 940 230 {lab=vo1}
N 690 130 730 130 {lab=VDD}
N 690 210 730 210 {lab=VSS}
N 340 210 340 250 {lab=vin2}
N 340 190 360 190 {lab=vin2}
N 180 200 180 260 {lab=vin1}
N 180 190 180 200 {lab=vin1}
N 270 170 390 170 {lab=vin1}
N 360 190 390 190 {lab=vin2}
N 110 110 110 130 {
lab=GND}
N 280 100 280 120 {
lab=GND}
N 110 30 110 50 {lab=vb1}
N 110 20 110 30 {lab=vb1}
N 340 150 390 150 {lab=vb1}
N 840 190 840 220 {lab=ibn}
N 840 280 840 310 {lab=VDD}
N 730 190 840 190 {lab=ibn}
N 280 40 280 50 {lab=vb3}
N 280 120 280 130 {lab=GND}
N 280 90 280 100 {lab=GND}
N 680 150 690 150 {lab=vo1}
N 180 170 180 190 {lab=vin1}
N 340 190 340 210 {lab=vin2}
N 940 150 940 170 {lab=vo1}
N 730 150 940 150 {lab=vo1}
N 690 150 730 150 {lab=vo1}
N 890 170 890 190 {lab=vo2}
N 730 170 890 170 {lab=vo2}
N 690 170 730 170 {lab=vo2}
N 690 190 730 190 {lab=ibn}
N 280 10 280 40 {lab=vb3}
N 340 130 390 130 {lab=vb3}
C {devices/lab_wire.sym} 840 310 0 0 {name=p2 sig_type=std_logic lab=VDD}
C {devices/code_shown.sym} 1720 80 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value="
.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.param vdd=3.3 vcm=2 ibn=5m vb1=1 vb3=1.8
.save all

.control
    save all
    op
    show all
    write lna_telescopic_tb.raw
.endc
"}
C {devices/launcher.sym} 820 490 0 0 {name=h26
descr="Annotate OP" 
tclcommand="set show_hidden_texts 1; xschem annotate_op"
}
C {devices/launcher.sym} 820 530 0 0 {name=h27
descr="Load AC" 
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw ac
"
}
C {devices/lab_wire.sym} 730 150 0 1 {name=p11 sig_type=std_logic lab=vo1}
C {devices/vcvs.sym} 180 370 0 1 {name=E1 value=0.85}
C {devices/vcvs.sym} 340 370 0 0 {name=E2 value=0.85}
C {devices/vsource.sym} 80 490 0 0 {name=Vdm value="dc 0 ac 1" savecurrent=false}
C {devices/vsource.sym} 260 490 0 0 {name=Vcm value=\{vcm\} savecurrent=false}
C {devices/gnd.sym} 80 540 0 0 {name=l5 lab=GND}
C {devices/gnd.sym} 260 540 0 0 {name=l6 lab=GND}
C {devices/gnd.sym} 260 410 0 0 {name=l7 lab=GND}
C {devices/vsource.sym} 540 490 0 0 {name=V0 value=0 savecurrent=false}
C {devices/gnd.sym} 540 540 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 620 490 0 0 {name=V1 value=\{vdd\} savecurrent=false}
C {devices/lab_wire.sym} 540 420 0 0 {name=p1 sig_type=std_logic lab=VSS}
C {devices/lab_wire.sym} 620 420 0 0 {name=p5 sig_type=std_logic lab=VDD}
C {devices/gnd.sym} 620 540 0 0 {name=l1 lab=GND}
C {devices/isource.sym} 840 250 2 1 {name=IB value=\{ibn\}}
C {devices/lab_wire.sym} 340 170 0 1 {name=p4 sig_type=std_logic lab=vin1}
C {devices/lab_wire.sym} 340 190 0 1 {name=p6 sig_type=std_logic lab=vin2}
C {devices/lab_wire.sym} 730 170 0 1 {name=p7 sig_type=std_logic lab=vo2}
C {res.sym} 890 260 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {res.sym} 940 260 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
C {devices/lab_wire.sym} 730 130 0 1 {name=p8 sig_type=std_logic lab=VDD
}
C {devices/lab_wire.sym} 730 210 0 1 {name=p10 sig_type=std_logic lab=VSS
}
C {devices/vsource.sym} 110 80 0 0 {name=V2 value=\{vb1\} savecurrent=false}
C {devices/gnd.sym} 110 130 0 0 {name=l8 lab=GND}
C {devices/vsource.sym} 280 70 0 0 {name=V3 value=2.6 savecurrent=false}
C {devices/gnd.sym} 280 120 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 110 20 0 1 {name=p12 sig_type=std_logic lab=vb1}
C {devices/lab_wire.sym} 340 150 0 1 {name=p14 sig_type=std_logic lab=vb1}
C {devices/lab_wire.sym} 730 190 0 1 {name=p17 sig_type=std_logic lab=ibn}
C {devices/lab_wire.sym} 890 330 0 1 {name=p18 sig_type=std_logic lab=Vcm}
C {devices/lab_wire.sym} 940 330 0 1 {name=p19 sig_type=std_logic lab=Vcm}
C {lna_telescopic.sym} 540 170 0 0 {name=x1}
C {devices/lab_wire.sym} 280 10 0 1 {name=p3 sig_type=std_logic lab=vb3}
C {devices/lab_wire.sym} 340 130 0 1 {name=p9 sig_type=std_logic lab=vb3}

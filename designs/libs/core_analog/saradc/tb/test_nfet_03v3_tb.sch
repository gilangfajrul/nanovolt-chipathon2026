v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {devices/code_shown.sym} 120 -80 0 0 {name=MODELS only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
"}
C {devices/code_shown.sym} 400 -370 0 0 {name=NGSPICE only_toplevel=true
value="
.include test_nfet_03v3_tb.save
vg g 0 1.65
vd d 0 1.65
vs s 0 0
vb b 0 0
.control
save all
op
write test_nfet_03v3_tb.raw
.endc
"}
C {test_nfet_03v3.sym} 190 -280 0 0 {name=x1}
C {lab_pin.sym} 40 -300 0 0 {name=p1 sig_type=std_logic lab=G}
C {lab_pin.sym} 340 -300 2 0 {name=p2 sig_type=std_logic lab=D}
C {lab_pin.sym} 340 -280 2 0 {name=p3 sig_type=std_logic lab=B}
C {lab_pin.sym} 340 -260 2 0 {name=p4 sig_type=std_logic lab=S}

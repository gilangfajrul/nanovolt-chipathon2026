v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N 390 -410 390 -440 {lab=out}
N 550 -410 550 -440 {lab=out}
N 710 -410 710 -440 {lab=out}
N 330 -440 710 -440 {lab=out}
N 390 -350 390 -320 {lab=vrefp}
N 550 -350 550 -320 {lab=vcm}
N 710 -350 710 -320 {lab=vrefn}
N 310 -380 350 -380 {lab=up}
N 470 -380 510 -380 {lab=mid}
N 630 -380 670 -380 {lab=dn}
N 310 -360 350 -360 {lab=vss}
N 470 -360 510 -360 {lab=vss}
N 630 -360 670 -360 {lab=vss}
C {switch_ngspice.sym} 390 -380 0 0 {name=Sp model=CDSW device_model=""}
C {switch_ngspice.sym} 550 -380 0 0 {name=Sm model=CDSW device_model=""}
C {switch_ngspice.sym} 710 -380 0 0 {name=Sn model=CDSW device_model=""}
C {iopin.sym} 330 -440 2 0 {name=p_out lab=out}
C {iopin.sym} 390 -320 1 0 {name=p_vrefp lab=vrefp}
C {iopin.sym} 550 -320 1 0 {name=p_vcm lab=vcm}
C {iopin.sym} 710 -320 1 0 {name=p_vrefn lab=vrefn}
C {ipin.sym} 310 -380 2 0 {name=p_up lab=up}
C {ipin.sym} 630 -380 2 0 {name=p_dn lab=dn}
C {iopin.sym} 310 -360 2 0 {name=p_vss lab=vss}
C {lab_pin.sym} 470 -380 0 0 {name=l_mid lab=mid}
C {lab_pin.sym} 470 -360 0 0 {name=l_vss1 lab=vss}
C {lab_pin.sym} 630 -360 0 0 {name=l_vss2 lab=vss}
C {code.sym} 300 -250 0 0 {name=Bmid value="Bmid mid vss V=((v(up,vss)<1.65)*(v(dn,vss)<1.65))*3.3"}
C {code.sym} 700 -250 0 0 {name=CDSW_MODEL value=".model CDSW SW VT=0.9 VH=0.01 RON=0.01 ROFF=10G"}
C {title.sym} 160 -50 0 0 {name=l1 author="Gilang Fajrul Falah"}

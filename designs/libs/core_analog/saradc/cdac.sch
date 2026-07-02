v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
C {switch_ngspice.sym} 430 -1070 0 0 {name=SsampP model=CDSW device_model=""}
C {lab_pin.sym} 430 -1100 0 0 {name=l_SsampP_P lab=topp}
C {lab_pin.sym} 430 -1040 0 0 {name=l_SsampP_M lab=vinp}
C {lab_pin.sym} 390 -1070 0 0 {name=l_SsampP_CP lab=sample}
C {lab_pin.sym} 390 -1050 0 0 {name=l_SsampP_CM lab=vss}
C {cap_array.sym} 1400 -1000 0 0 {name=XAP}
C {lab_pin.sym} 1400 -1070 0 0 {name=l_XAP_top lab=topp}
C {lab_pin.sym} 1200 -930 0 0 {name=l_XAP_b8 lab=bP8}
C {lab_pin.sym} 1240 -930 0 0 {name=l_XAP_b7 lab=bP7}
C {lab_pin.sym} 1280 -930 0 0 {name=l_XAP_b6 lab=bP6}
C {lab_pin.sym} 1320 -930 0 0 {name=l_XAP_b5 lab=bP5}
C {lab_pin.sym} 1360 -930 0 0 {name=l_XAP_b4 lab=bP4}
C {lab_pin.sym} 1400 -930 0 0 {name=l_XAP_b3 lab=bP3}
C {lab_pin.sym} 1440 -930 0 0 {name=l_XAP_b2 lab=bP2}
C {lab_pin.sym} 1480 -930 0 0 {name=l_XAP_b1 lab=bP1}
C {lab_pin.sym} 1520 -930 0 0 {name=l_XAP_b0 lab=bP0}
C {lab_pin.sym} 1560 -930 0 0 {name=l_XAP_bd lab=vcm}
C {mux3.sym} 250 -800 0 0 {name=XMP8}
C {lab_pin.sym} 250 -860 0 0 {name=l_XMP8_out lab=bP8}
C {lab_pin.sym} 200 -740 0 0 {name=l_XMP8_vrefp lab=vrefp}
C {lab_pin.sym} 250 -740 0 0 {name=l_XMP8_vcm lab=vcm}
C {lab_pin.sym} 300 -740 0 0 {name=l_XMP8_vrefn lab=vrefn}
C {lab_pin.sym} 140 -815 0 0 {name=l_XMP8_up lab=upP[8]}
C {lab_pin.sym} 140 -785 0 0 {name=l_XMP8_dn lab=dnP[8]}
C {lab_pin.sym} 360 -800 0 0 {name=l_XMP8_vss lab=vss}
C {mux3.sym} 570 -800 0 0 {name=XMP7}
C {lab_pin.sym} 570 -860 0 0 {name=l_XMP7_out lab=bP7}
C {lab_pin.sym} 520 -740 0 0 {name=l_XMP7_vrefp lab=vrefp}
C {lab_pin.sym} 570 -740 0 0 {name=l_XMP7_vcm lab=vcm}
C {lab_pin.sym} 620 -740 0 0 {name=l_XMP7_vrefn lab=vrefn}
C {lab_pin.sym} 460 -815 0 0 {name=l_XMP7_up lab=upP[7]}
C {lab_pin.sym} 460 -785 0 0 {name=l_XMP7_dn lab=dnP[7]}
C {lab_pin.sym} 680 -800 0 0 {name=l_XMP7_vss lab=vss}
C {mux3.sym} 890 -800 0 0 {name=XMP6}
C {lab_pin.sym} 890 -860 0 0 {name=l_XMP6_out lab=bP6}
C {lab_pin.sym} 840 -740 0 0 {name=l_XMP6_vrefp lab=vrefp}
C {lab_pin.sym} 890 -740 0 0 {name=l_XMP6_vcm lab=vcm}
C {lab_pin.sym} 940 -740 0 0 {name=l_XMP6_vrefn lab=vrefn}
C {lab_pin.sym} 780 -815 0 0 {name=l_XMP6_up lab=upP[6]}
C {lab_pin.sym} 780 -785 0 0 {name=l_XMP6_dn lab=dnP[6]}
C {lab_pin.sym} 1000 -800 0 0 {name=l_XMP6_vss lab=vss}
C {mux3.sym} 1210 -800 0 0 {name=XMP5}
C {lab_pin.sym} 1210 -860 0 0 {name=l_XMP5_out lab=bP5}
C {lab_pin.sym} 1160 -740 0 0 {name=l_XMP5_vrefp lab=vrefp}
C {lab_pin.sym} 1210 -740 0 0 {name=l_XMP5_vcm lab=vcm}
C {lab_pin.sym} 1260 -740 0 0 {name=l_XMP5_vrefn lab=vrefn}
C {lab_pin.sym} 1100 -815 0 0 {name=l_XMP5_up lab=upP[5]}
C {lab_pin.sym} 1100 -785 0 0 {name=l_XMP5_dn lab=dnP[5]}
C {lab_pin.sym} 1320 -800 0 0 {name=l_XMP5_vss lab=vss}
C {mux3.sym} 1530 -800 0 0 {name=XMP4}
C {lab_pin.sym} 1530 -860 0 0 {name=l_XMP4_out lab=bP4}
C {lab_pin.sym} 1480 -740 0 0 {name=l_XMP4_vrefp lab=vrefp}
C {lab_pin.sym} 1530 -740 0 0 {name=l_XMP4_vcm lab=vcm}
C {lab_pin.sym} 1580 -740 0 0 {name=l_XMP4_vrefn lab=vrefn}
C {lab_pin.sym} 1420 -815 0 0 {name=l_XMP4_up lab=upP[4]}
C {lab_pin.sym} 1420 -785 0 0 {name=l_XMP4_dn lab=dnP[4]}
C {lab_pin.sym} 1640 -800 0 0 {name=l_XMP4_vss lab=vss}
C {mux3.sym} 1850 -800 0 0 {name=XMP3}
C {lab_pin.sym} 1850 -860 0 0 {name=l_XMP3_out lab=bP3}
C {lab_pin.sym} 1800 -740 0 0 {name=l_XMP3_vrefp lab=vrefp}
C {lab_pin.sym} 1850 -740 0 0 {name=l_XMP3_vcm lab=vcm}
C {lab_pin.sym} 1900 -740 0 0 {name=l_XMP3_vrefn lab=vrefn}
C {lab_pin.sym} 1740 -815 0 0 {name=l_XMP3_up lab=upP[3]}
C {lab_pin.sym} 1740 -785 0 0 {name=l_XMP3_dn lab=dnP[3]}
C {lab_pin.sym} 1960 -800 0 0 {name=l_XMP3_vss lab=vss}
C {mux3.sym} 2170 -800 0 0 {name=XMP2}
C {lab_pin.sym} 2170 -860 0 0 {name=l_XMP2_out lab=bP2}
C {lab_pin.sym} 2120 -740 0 0 {name=l_XMP2_vrefp lab=vrefp}
C {lab_pin.sym} 2170 -740 0 0 {name=l_XMP2_vcm lab=vcm}
C {lab_pin.sym} 2220 -740 0 0 {name=l_XMP2_vrefn lab=vrefn}
C {lab_pin.sym} 2060 -815 0 0 {name=l_XMP2_up lab=upP[2]}
C {lab_pin.sym} 2060 -785 0 0 {name=l_XMP2_dn lab=dnP[2]}
C {lab_pin.sym} 2280 -800 0 0 {name=l_XMP2_vss lab=vss}
C {mux3.sym} 2490 -800 0 0 {name=XMP1}
C {lab_pin.sym} 2490 -860 0 0 {name=l_XMP1_out lab=bP1}
C {lab_pin.sym} 2440 -740 0 0 {name=l_XMP1_vrefp lab=vrefp}
C {lab_pin.sym} 2490 -740 0 0 {name=l_XMP1_vcm lab=vcm}
C {lab_pin.sym} 2540 -740 0 0 {name=l_XMP1_vrefn lab=vrefn}
C {lab_pin.sym} 2380 -815 0 0 {name=l_XMP1_up lab=upP[1]}
C {lab_pin.sym} 2380 -785 0 0 {name=l_XMP1_dn lab=dnP[1]}
C {lab_pin.sym} 2600 -800 0 0 {name=l_XMP1_vss lab=vss}
C {mux3.sym} 2810 -800 0 0 {name=XMP0}
C {lab_pin.sym} 2810 -860 0 0 {name=l_XMP0_out lab=bP0}
C {lab_pin.sym} 2760 -740 0 0 {name=l_XMP0_vrefp lab=vrefp}
C {lab_pin.sym} 2810 -740 0 0 {name=l_XMP0_vcm lab=vcm}
C {lab_pin.sym} 2860 -740 0 0 {name=l_XMP0_vrefn lab=vrefn}
C {lab_pin.sym} 2700 -815 0 0 {name=l_XMP0_up lab=upP[0]}
C {lab_pin.sym} 2700 -785 0 0 {name=l_XMP0_dn lab=dnP[0]}
C {lab_pin.sym} 2920 -800 0 0 {name=l_XMP0_vss lab=vss}
C {cap_array.sym} 1400 -250 0 0 {name=XAN}
C {lab_pin.sym} 1400 -320 0 0 {name=l_XAN_top lab=topn}
C {lab_pin.sym} 1200 -180 0 0 {name=l_XAN_b8 lab=bN8}
C {lab_pin.sym} 1240 -180 0 0 {name=l_XAN_b7 lab=bN7}
C {lab_pin.sym} 1280 -180 0 0 {name=l_XAN_b6 lab=bN6}
C {lab_pin.sym} 1320 -180 0 0 {name=l_XAN_b5 lab=bN5}
C {lab_pin.sym} 1360 -180 0 0 {name=l_XAN_b4 lab=bN4}
C {lab_pin.sym} 1400 -180 0 0 {name=l_XAN_b3 lab=bN3}
C {lab_pin.sym} 1440 -180 0 0 {name=l_XAN_b2 lab=bN2}
C {lab_pin.sym} 1480 -180 0 0 {name=l_XAN_b1 lab=bN1}
C {lab_pin.sym} 1520 -180 0 0 {name=l_XAN_b0 lab=bN0}
C {lab_pin.sym} 1560 -180 0 0 {name=l_XAN_bd lab=vcm}
C {mux3.sym} 250 -450 0 0 {name=XMN8}
C {lab_pin.sym} 250 -510 0 0 {name=l_XMN8_out lab=bN8}
C {lab_pin.sym} 200 -390 0 0 {name=l_XMN8_vrefp lab=vrefp}
C {lab_pin.sym} 250 -390 0 0 {name=l_XMN8_vcm lab=vcm}
C {lab_pin.sym} 300 -390 0 0 {name=l_XMN8_vrefn lab=vrefn}
C {lab_pin.sym} 140 -465 0 0 {name=l_XMN8_up lab=upN[8]}
C {lab_pin.sym} 140 -435 0 0 {name=l_XMN8_dn lab=dnN[8]}
C {lab_pin.sym} 360 -450 0 0 {name=l_XMN8_vss lab=vss}
C {mux3.sym} 570 -450 0 0 {name=XMN7}
C {lab_pin.sym} 570 -510 0 0 {name=l_XMN7_out lab=bN7}
C {lab_pin.sym} 520 -390 0 0 {name=l_XMN7_vrefp lab=vrefp}
C {lab_pin.sym} 570 -390 0 0 {name=l_XMN7_vcm lab=vcm}
C {lab_pin.sym} 620 -390 0 0 {name=l_XMN7_vrefn lab=vrefn}
C {lab_pin.sym} 460 -465 0 0 {name=l_XMN7_up lab=upN[7]}
C {lab_pin.sym} 460 -435 0 0 {name=l_XMN7_dn lab=dnN[7]}
C {lab_pin.sym} 680 -450 0 0 {name=l_XMN7_vss lab=vss}
C {mux3.sym} 890 -450 0 0 {name=XMN6}
C {lab_pin.sym} 890 -510 0 0 {name=l_XMN6_out lab=bN6}
C {lab_pin.sym} 840 -390 0 0 {name=l_XMN6_vrefp lab=vrefp}
C {lab_pin.sym} 890 -390 0 0 {name=l_XMN6_vcm lab=vcm}
C {lab_pin.sym} 940 -390 0 0 {name=l_XMN6_vrefn lab=vrefn}
C {lab_pin.sym} 780 -465 0 0 {name=l_XMN6_up lab=upN[6]}
C {lab_pin.sym} 780 -435 0 0 {name=l_XMN6_dn lab=dnN[6]}
C {lab_pin.sym} 1000 -450 0 0 {name=l_XMN6_vss lab=vss}
C {mux3.sym} 1210 -450 0 0 {name=XMN5}
C {lab_pin.sym} 1210 -510 0 0 {name=l_XMN5_out lab=bN5}
C {lab_pin.sym} 1160 -390 0 0 {name=l_XMN5_vrefp lab=vrefp}
C {lab_pin.sym} 1210 -390 0 0 {name=l_XMN5_vcm lab=vcm}
C {lab_pin.sym} 1260 -390 0 0 {name=l_XMN5_vrefn lab=vrefn}
C {lab_pin.sym} 1100 -465 0 0 {name=l_XMN5_up lab=upN[5]}
C {lab_pin.sym} 1100 -435 0 0 {name=l_XMN5_dn lab=dnN[5]}
C {lab_pin.sym} 1320 -450 0 0 {name=l_XMN5_vss lab=vss}
C {mux3.sym} 1530 -450 0 0 {name=XMN4}
C {lab_pin.sym} 1530 -510 0 0 {name=l_XMN4_out lab=bN4}
C {lab_pin.sym} 1480 -390 0 0 {name=l_XMN4_vrefp lab=vrefp}
C {lab_pin.sym} 1530 -390 0 0 {name=l_XMN4_vcm lab=vcm}
C {lab_pin.sym} 1580 -390 0 0 {name=l_XMN4_vrefn lab=vrefn}
C {lab_pin.sym} 1420 -465 0 0 {name=l_XMN4_up lab=upN[4]}
C {lab_pin.sym} 1420 -435 0 0 {name=l_XMN4_dn lab=dnN[4]}
C {lab_pin.sym} 1640 -450 0 0 {name=l_XMN4_vss lab=vss}
C {mux3.sym} 1850 -450 0 0 {name=XMN3}
C {lab_pin.sym} 1850 -510 0 0 {name=l_XMN3_out lab=bN3}
C {lab_pin.sym} 1800 -390 0 0 {name=l_XMN3_vrefp lab=vrefp}
C {lab_pin.sym} 1850 -390 0 0 {name=l_XMN3_vcm lab=vcm}
C {lab_pin.sym} 1900 -390 0 0 {name=l_XMN3_vrefn lab=vrefn}
C {lab_pin.sym} 1740 -465 0 0 {name=l_XMN3_up lab=upN[3]}
C {lab_pin.sym} 1740 -435 0 0 {name=l_XMN3_dn lab=dnN[3]}
C {lab_pin.sym} 1960 -450 0 0 {name=l_XMN3_vss lab=vss}
C {mux3.sym} 2170 -450 0 0 {name=XMN2}
C {lab_pin.sym} 2170 -510 0 0 {name=l_XMN2_out lab=bN2}
C {lab_pin.sym} 2120 -390 0 0 {name=l_XMN2_vrefp lab=vrefp}
C {lab_pin.sym} 2170 -390 0 0 {name=l_XMN2_vcm lab=vcm}
C {lab_pin.sym} 2220 -390 0 0 {name=l_XMN2_vrefn lab=vrefn}
C {lab_pin.sym} 2060 -465 0 0 {name=l_XMN2_up lab=upN[2]}
C {lab_pin.sym} 2060 -435 0 0 {name=l_XMN2_dn lab=dnN[2]}
C {lab_pin.sym} 2280 -450 0 0 {name=l_XMN2_vss lab=vss}
C {mux3.sym} 2490 -450 0 0 {name=XMN1}
C {lab_pin.sym} 2490 -510 0 0 {name=l_XMN1_out lab=bN1}
C {lab_pin.sym} 2440 -390 0 0 {name=l_XMN1_vrefp lab=vrefp}
C {lab_pin.sym} 2490 -390 0 0 {name=l_XMN1_vcm lab=vcm}
C {lab_pin.sym} 2540 -390 0 0 {name=l_XMN1_vrefn lab=vrefn}
C {lab_pin.sym} 2380 -465 0 0 {name=l_XMN1_up lab=upN[1]}
C {lab_pin.sym} 2380 -435 0 0 {name=l_XMN1_dn lab=dnN[1]}
C {lab_pin.sym} 2600 -450 0 0 {name=l_XMN1_vss lab=vss}
C {mux3.sym} 2810 -450 0 0 {name=XMN0}
C {lab_pin.sym} 2810 -510 0 0 {name=l_XMN0_out lab=bN0}
C {lab_pin.sym} 2760 -390 0 0 {name=l_XMN0_vrefp lab=vrefp}
C {lab_pin.sym} 2810 -390 0 0 {name=l_XMN0_vcm lab=vcm}
C {lab_pin.sym} 2860 -390 0 0 {name=l_XMN0_vrefn lab=vrefn}
C {lab_pin.sym} 2700 -465 0 0 {name=l_XMN0_up lab=upN[0]}
C {lab_pin.sym} 2700 -435 0 0 {name=l_XMN0_dn lab=dnN[0]}
C {lab_pin.sym} 2920 -450 0 0 {name=l_XMN0_vss lab=vss}
C {switch_ngspice.sym} 420 -230 0 0 {name=SsampN model=CDSW device_model=""}
C {lab_pin.sym} 420 -260 0 0 {name=l_SsampN_P lab=topn}
C {lab_pin.sym} 420 -200 0 0 {name=l_SsampN_M lab=vinn}
C {lab_pin.sym} 380 -230 0 0 {name=l_SsampN_CP lab=sample}
C {lab_pin.sym} 380 -210 0 0 {name=l_SsampN_CM lab=vss}
C {code.sym} 60 -1150 0 0 {name=CDSW_MODEL value=".model CDSW SW VT=0.9 VH=0.01 RON=0.01 ROFF=10G"}
C {ipin.sym} 3100 -490 0 0 {name=p_vinp lab=vinp}
C {ipin.sym} 3100 -510 0 0 {name=p_vinn lab=vinn}
C {ipin.sym} 3100 -530 0 0 {name=p_sample lab=sample}
C {ipin.sym} 3100 -550 0 0 {name=p_vrefp lab=vrefp}
C {ipin.sym} 3100 -570 0 0 {name=p_vcm lab=vcm}
C {ipin.sym} 3100 -590 0 0 {name=p_vrefn lab=vrefn}
C {iopin.sym} 3100 -610 0 0 {name=p_vss lab=vss}
C {opin.sym} 3100 -630 0 0 {name=p_topp lab=topp}
C {opin.sym} 3100 -650 0 0 {name=p_topn lab=topn}
C {ipin.sym} 3100 -690 0 0 {name=p_upP lab=upP[8:0]}
C {ipin.sym} 3100 -710 0 0 {name=p_dnP lab=dnP[8:0]}
C {ipin.sym} 3100 -730 0 0 {name=p_upN lab=upN[8:0]}
C {ipin.sym} 3100 -750 0 0 {name=p_dnN lab=dnN[8:0]}
C {title.sym} 160 -40 0 0 {name=l1 author="Gilang Fajrul Falah"}

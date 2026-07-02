v {xschem version=3.4.8RC file_version=1.3
* Copyright 2022 GlobalFoundries PDK Authors
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     https://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.

}
G {}
K {}
V {}
S {}
F {}
E {}
N 50 -410 90 -410 {
lab=G}
N 130 -490 130 -440 {
lab=D}
N 130 -410 230 -410 {
lab=B}
N 130 -380 130 -310 {
lab=S}
C {devices/title.sym} 160 -30 0 0 {name=l5 author="GlobalFoundries PDK Authors"}
C {symbols/nfet_03v3.sym} 110 -410 0 0 {name=M1
L=0.28u
W=0.22u
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {devices/launcher.sym} 695 -515 0 0 {name=h1
descr="Click left mouse button here with control key
pressed to load/unload waveforms in graph."
tclcommand="
xschem raw_read $netlist_dir/[file tail [file rootname [xschem get current_name]]].raw
"
}
C {devices/launcher.sym} 685 -605 0 0 {name=h2
descr="STEP 1: Ctrl+click to generate the FET .save file
(gm/id) for this schematic, then Netlist + Simulate.
Same as menu: GF180 > Create FET .save file."
tclcommand="
write_data [save_fet_params] $netlist_dir/[file rootname [file tail [xschem get current_name]]].save
"
}
C {ipin.sym} 50 -410 0 0 {name=p1 lab=G}
C {iopin.sym} 130 -490 2 0 {name=p3 lab=D}
C {iopin.sym} 130 -310 2 0 {name=p2 lab=S}
C {iopin.sym} 230 -410 0 0 {name=p4 lab=B}

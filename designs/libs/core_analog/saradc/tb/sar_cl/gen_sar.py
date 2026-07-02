import pathlib
flat = pathlib.Path("/foss/designs/nanovolt-chipathon2026/designs/libs/core_analog/saradc/tb/simulation/cdac_comp_tb.spice").read_text().splitlines()
blocks, cur = [], None
for ln in flat:
    s = ln.strip()
    if s.lower().startswith(".subckt"): cur = [ln]
    elif cur is not None:
        cur.append(ln)
        if s.lower().startswith(".ends"): blocks.append("\n".join(cur)); cur=None
subckts = "\n\n".join(blocks)

inst = """x1 dnN[8] dnN[7] dnN[6] dnN[5] dnN[4] dnN[3] dnN[2] dnN[1] dnN[0] upN[8] upN[7] upN[6] upN[5] upN[4] upN[3] upN[2] upN[1] upN[0]
+ dnP[8] dnP[7] dnP[6] dnP[5] dnP[4] dnP[3] dnP[2] dnP[1] dnP[0] upP[8] upP[7] upP[6] upP[5] upP[4] upP[3] upP[2] upP[1] upP[0] topn topp
+ vss vrefn vcm vrefp sample vinn vinp cdac
x2 vdd vss x topn y topp clk comparator"""

ctrl_srcs = "\n".join(f"V{fam}{i} {fam}[{i}] 0 0" for fam in ["upP","dnP","upN","dnN"] for i in range(8,-1,-1))

L = [".control","set noaskquit","save x topp topn"]
for k in range(10): L.append(f"stop when time = {18.6+10*k}n")
L.append("run")
for k in range(9,-1,-1):
    L += ["let nlast = length(v(x)) - 1","let xlast = v(x)[nlast]",f"if (xlast > 1.65)",f"  let b{k} = 1"]
    if k>=1:
        c=k-1; L += [f"  alter VdnP{c} = 3.3",f"  alter VupN{c} = 3.3"]
    L += ["else",f"  let b{k} = 0"]
    if k>=1:
        c=k-1; L += [f"  alter VupP{c} = 3.3",f"  alter VdnN{c} = 3.3"]
    L += ["end"]
    if k>=1: L.append("resume")
L.append("let code = " + " + ".join(f"b{k}*{2**k}" for k in range(9,-1,-1)))
L += ['echo "RESULT_CODE_BELOW"',"print code","print b9 b8 b7 b6 b5 b4 b3 b2 b1 b0",".endc"]
control = "\n".join(L)

net = f"""* SAR closed-loop reactive TB (code reproduction)
{inst}

.include /foss/pdks/gf180mcuD/libs.tech/ngspice/design.ngspice
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice typical
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice cap_mim
.lib /foss/pdks/gf180mcuD/libs.tech/ngspice/sm141064.ngspice mimcap_typical

Vvdd vdd 0 3.3
Vvss vss 0 0
Vvrefp vrefp 0 1
Vvrefn vrefn 0 0
Vvcm vcm 0 0.5
Vsample sample 0 PWL(0 3.3 9n 3.3 9.05n 0)
Vclk clk 0 pulse(0 3.3 15n 50p 50p 4n 10n)
Cx x 0 20f
Cy y 0 20f

.param CM = 1.65
.param vid = 0.9385
Vvinp vinp 0 'CM+vid/2'
Vvinn vinn 0 'CM-vid/2'

{ctrl_srcs}

.tran 20p 112n uic

{control}

{subckts}
.end
"""
pathlib.Path("sar_cl_tb.spice").write_text(net)
print("written", len(net.splitlines()),"lines")

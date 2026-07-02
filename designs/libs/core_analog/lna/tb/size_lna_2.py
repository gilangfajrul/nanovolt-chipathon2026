from pygmid import Lookup as lk
import numpy as np

n = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/nfet_03v3.mat')
#p = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simula>


# Check what the table actually gives at a known point
vgs_test = 0.77  # your NMOS input pair operating point
L_test = 0.28

jd = n.lookup('ID_W', VGS=vgs_test, L=L_test)
gm_id = n.lookup('GM_ID', VGS=vgs_test, L=L_test)
print(f"jd = {float(np.array(jd).flatten()[0])*1e6:.4f} uA/um")
print(f"gm/ID = {float(np.array(gm_id).flatten()[0]):.2f} S/A")

vgs_sweep = np.arange(0.3, 1.2, 0.001)
for vgs in [0.50, 0.55, 0.60, 0.65, 0.70, 0.77]:
    jd = float(np.array(n.lookup('ID_W', VGS=vgs, L=0.28)).flatten()[0])
    gmid = float(np.array(n.lookup('GM_ID', VGS=vgs, L=0.28)).flatten()[0])
    W_needed = 2.5e-3 / jd  # for 2.5mA target
    print(f"VGS={vgs:.2f}V: gm/ID={gmid:.1f} S/A, jd={jd*1e6:.3f} uA/um, W_needed={W_needed:.1f} um")

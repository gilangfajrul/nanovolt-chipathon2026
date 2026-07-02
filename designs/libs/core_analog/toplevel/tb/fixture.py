"""Test fixture for the behavioral RX front-end chain (toplevel).

Mirrors the style of libs/tb_analog/tb_ota_5t/fixture.py: helper functions
assemble a netlist string which is written out and handed to ngspice -b.
Behavioral models use only ideal sources + the XSPICE s_xfer code model,
so no PDK device models are required.
"""
import os
import subprocess

NGSPICE = "/foss/tools/bin/ngspice"
HERE = os.path.dirname(os.path.abspath(__file__))
MODELS = os.path.normpath(os.path.join(HERE, "..", "models"))
SIM_ROOT = os.path.join(HERE, "sims")


def run_ngspice(netlist, sim_dir):
    os.makedirs(sim_dir, exist_ok=True)
    netpath = os.path.join(sim_dir, "netlist.spice")
    with open(netpath, "w") as f:
        f.write(netlist)
    print(f"Running ngspice in {sim_dir}")
    result = subprocess.run(
        [NGSPICE, "-b", netpath], capture_output=True, text=True
    )
    with open(os.path.join(sim_dir, "ngspice.log"), "w") as f:
        f.write(result.stdout)
        f.write(result.stderr)
    assert "Error" not in (result.stdout + result.stderr), result.stdout + result.stderr
    return result.stdout


# ---------------------------------------------------------------- netlist parts
def netlist_models():
    return f"""
* ---------------- Behavioral models ----------------
.include {MODELS}/bias_beh.spice
.include {MODELS}/lna_beh.spice
.include {MODELS}/pgaaaf_beh.spice
.include {MODELS}/saradc_beh.spice
"""


def netlist_chain(pga_gain_db=20):
    """Instantiate the chain FLAT so every internal tap is a top-level node."""
    return f"""
* ---------------- RX chain (flat for easy probing) ----------------
xbias vcm vref 0 bias_beh
xlna  inp inn lp ln vcm lna_beh
xpga  lp ln pp pn vcm pgaaaf_beh gain_db={pga_gain_db}
xadc  pp pn clk dout saradc_beh
"""


def netlist_stim_dc(vd_in=100e-6):
    """Differential DC input, centred on vcm (driven by bias)."""
    return f"""
* ---------------- DC differential stimulus ----------------
Vinp inp vcm dc {vd_in/2}
Vinn inn vcm dc {-vd_in/2}
Vclk clk 0 dc 0
"""


def netlist_stim_ac():
    """Unit differential AC input (vd_in amplitude = 1)."""
    return f"""
* ---------------- AC differential stimulus ----------------
Vinp inp vcm dc 0 ac 0.5
Vinn inn vcm dc 0 ac -0.5
Vclk clk 0 dc 0
"""


def netlist_stim_sin(amp_se, fin):
    """Antiphase sine pair -> differential amplitude = 2*amp_se."""
    return f"""
* ---------------- Transient differential stimulus ----------------
Vinp inp vcm SIN(0 {amp_se} {fin})
Vinn inn vcm SIN(0 {-amp_se} {fin})
"""


def netlist_clock(fs=10e6, vhi=3.3, twin=4e-9):
    """ADC sample clock: short track window, sample on falling edge."""
    per = 1.0 / fs
    return f"""
* ---------------- ADC sample clock ({fs:g} S/s) ----------------
Vclk clk 0 PULSE(0 {vhi} 0 1n 1n {twin} {per})
"""


# ---------------------------------------------------------------- analyses
def ctrl_gain(sim_dir, fmeas=1e3):
    """Small-signal gain via AC (s_xfer has no .op DC point, so AC not op)."""
    return f"""
.control
ac dec 10 100 1e6
let glna = db(v(lp)-v(ln))
let gtot = db(v(pp)-v(pn))
meas ac glna_db find glna at={fmeas}
meas ac gtot_db find gtot at={fmeas}
print glna_db gtot_db
.endc
"""


def ctrl_ac(sim_dir, start=1e3, stop=100e6, dec=50):
    return f"""
.control
ac dec {dec} {start} {stop}
let vod = v(pp)-v(pn)
let mag_db = db(vod)
meas ac gain_pass find mag_db at={start}
meas ac fc_3db when mag_db='gain_pass-3.0103'
print gain_pass fc_3db
.endc
"""


def ctrl_tran(sim_dir, tstep, tstop):
    txt = os.path.join(sim_dir, "tran_dout.txt")
    return f"""
.control
tran {tstep} {tstop} uic
wrdata {txt} v(dout)
.endc
"""

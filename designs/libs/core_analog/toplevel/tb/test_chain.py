"""Chain-level behavioral tests for the NanoVolt RX front-end.

Verifies the SYSTEM properties no single block proves on its own:
  test_gain  : total small-signal gain  (LNA 40 dB + PGA step)
  test_aaf   : anti-alias filter -3 dB corner (~4 MHz) + passband gain
  test_sndr  : 10-bit SAR ENOB/SNDR from an FFT of the sampled output

Run:  python3 test_chain.py        (or: pytest -s test_chain.py)
"""
import os
import math
import numpy as np

import fixture as fx


# ----------------------------------------------------------------------- gain
def test_gain(pga_gain_db=20, vd_in=100e-6):
    sim = os.path.join(fx.SIM_ROOT, "gain")
    net = (
        "* rx_chain DC gain\n"
        + fx.netlist_models()
        + fx.netlist_chain(pga_gain_db)
        + fx.netlist_stim_dc(vd_in)
        + fx.ctrl_op(sim)
        + ".end\n"
    )
    out = fx.run_ngspice(net, sim)

    vals = {}
    for line in out.splitlines():
        for key in ("vod_lna", "vod_pga"):
            if line.strip().startswith(key):
                vals[key] = float(line.split("=")[1])
    g_lna = vals["vod_lna"] / vd_in
    g_tot = vals["vod_pga"] / vd_in
    print(f"  LNA gain   = {20*math.log10(g_lna):6.2f} dB ({g_lna:.1f} V/V)")
    print(f"  total gain = {20*math.log10(g_tot):6.2f} dB ({g_tot:.1f} V/V)")
    exp = 100 * 10 ** (pga_gain_db / 20)
    assert abs(g_lna - 100) / 100 < 0.02, g_lna
    assert abs(g_tot - exp) / exp < 0.03, g_tot
    return g_tot


# ------------------------------------------------------------------------ aaf
def test_aaf(pga_gain_db=20):
    sim = os.path.join(fx.SIM_ROOT, "aaf")
    net = (
        "* rx_chain AAF response\n"
        + fx.netlist_models()
        + fx.netlist_chain(pga_gain_db)
        + fx.netlist_stim_ac()
        + fx.ctrl_ac(sim)
        + ".end\n"
    )
    out = fx.run_ngspice(net, sim)

    res = {}
    for line in out.splitlines():
        s = line.strip()
        for key in ("gain_pass", "fc_3db"):
            if s.startswith(key) and "=" in s:
                res[key] = float(s.split("=")[1].split()[0])
    print(f"  passband gain = {res['gain_pass']:6.2f} dB")
    print(f"  AAF -3 dB     = {res['fc_3db']/1e6:6.3f} MHz")
    assert abs(res["fc_3db"] - 4e6) / 4e6 < 0.05, res["fc_3db"]
    return res


# ----------------------------------------------------------------------- sndr
def test_sndr(pga_gain_db=20, nbits=10, fs=10e6, nfft=1024, dbfs=-1.0):
    # coherent input near the 2.72 MHz Larmor frequency
    m = 279                       # odd -> coprime with 1024
    fin = fs * m / nfft           # = 2.7246 MHz
    fs_full = 2.0                 # ADC differential full scale
    vd_amp = (fs_full / 2) * 10 ** (dbfs / 20)      # target amplitude at ADC
    g_tot = 100 * 10 ** (pga_gain_db / 20)
    amp_se = (vd_amp / g_tot) / 2                    # per-side input amplitude

    settle = 10e-6
    tstop = settle + (nfft + 4) / fs
    sim = os.path.join(fx.SIM_ROOT, "sndr")
    net = (
        "* rx_chain SNDR\n"
        + fx.netlist_models()
        + fx.netlist_chain(pga_gain_db)
        + fx.netlist_stim_sin(amp_se, fin)
        + fx.netlist_clock(fs)
        + fx.ctrl_tran(sim, tstep=2e-9, tstop=tstop)
        + ".end\n"
    )
    fx.run_ngspice(net, sim)

    data = np.loadtxt(os.path.join(sim, "tran_dout.txt"))
    t, d = data[:, 0], data[:, 1]
    # sample the held code mid-hold on the fs grid
    k0 = math.ceil(settle * fs)
    tsamp = (k0 + np.arange(nfft)) / fs + 0.5 / fs
    x = np.interp(tsamp, t, d)

    x = x - x.mean()
    win = np.ones(nfft)                      # coherent -> rectangular window
    X = np.fft.rfft(x * win)
    p = np.abs(X) ** 2
    sig_bin = m
    sig = p[sig_bin]
    noise = p.sum() - p[0] - sig             # exclude DC and signal bin
    sndr = 10 * math.log10(sig / noise)
    enob = (sndr - 1.76) / 6.02
    print(f"  fin = {fin/1e6:.4f} MHz, input {dbfs:.1f} dBFS")
    print(f"  SNDR = {sndr:6.2f} dB   ->   ENOB = {enob:5.2f} bits")
    assert enob >= nbits - 1.2, enob          # ideal 10b -> ~9.9 ENOB
    return sndr, enob


if __name__ == "__main__":
    print("[test_gain]")
    test_gain()
    print("[test_aaf]")
    test_aaf()
    print("[test_sndr]")
    test_sndr()

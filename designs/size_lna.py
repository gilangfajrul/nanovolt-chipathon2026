#from pygmid import Lookup as lk
#import numpy as np

#n = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/nfet_03v3.mat')

#L_target = 0.28
#ID_total = 2.5e-3   # 2.5 mA per side

# ── What gm/ID does your CURRENT schematic (W=400um) actually give? ────
#jd_actual = ID_total / 400   # A/um, using your existing W=400um
#print(f"Actual jd at W=400um: {jd_actual*1e6:.4f} uA/um")

#vgs_sweep = np.arange(0.3, 1.5, 0.001)
#jd_sweep = n.lookup('ID_W', VGS=vgs_sweep, L=L_target)
#jd_sweep = np.array(jd_sweep).flatten()

#idx = np.argmin(np.abs(jd_sweep - jd_actual))
#vgs_at_actual = vgs_sweep[idx]
#print(f"This corresponds to VGS = {vgs_at_actual:.3f} V")

#gm_id_actual = n.lookup('GM_ID', VGS=vgs_at_actual, L=L_target)
#gm_id_actual = float(np.array(gm_id_actual).flatten()[0])
#print(f"Actual gm/ID at this operating point: {gm_id_actual:.2f} S/A")

#gm_actual = n.lookup('GM', VGS=vgs_at_actual, L=L_target)
#gm_actual = float(np.array(gm_actual).flatten()[0])
#gm_total_at_W400 = gm_actual * (400 / 5.0)  # table reference width is 5um per earlier W=5um finger basis — verify below
#print(f"gm per 5um (table ref) = {gm_actual*1e3:.4f} mS")


"""
Full LNA telescopic cascode sizing script using gm/ID method via pygmid.

Topology recap:
  XM2a, XM2b  - PMOS cascode   (gate = vb3)
  XM2, XM1    - PMOS load      (XM2 diode-connected, mirrors to XM1)
  XM1a, XM1b  - NMOS cascode   (gate = vb1)
  XM3, XM4    - NMOS input pair (gates = vin1, vin2)
  XM0a, XM0b  - NMOS tail mirror (gate = ibn bias node)

Design roles -> target gm/ID (S/A):
  Input pair      : 20   (weak/moderate inversion -> max gm per mA -> min noise)
  NMOS cascode    : 15   (moderate inversion -> just needs to work, boosts Rout)
  PMOS load       : 10   (strong inversion -> LOW gm on purpose -> min noise contribution)
  PMOS cascode    : 12   (moderate inversion -> boosts Rout)
  Tail mirror     : 8    (strong inversion -> compact, stable, accurate mirror)

NOTE: Vsb assumed = 0 for all devices as a first-pass approximation.
This is a known simplification for the cascode devices, where source
sits above bulk potential in reality. To be revisited once a DC
operating point is available, per design log.
"""

from pygmid import Lookup as lk
import numpy as np

# ---- Load lookup tables -----------------------------------------------
# NMOS table at L=0.28um, PMOS table at L=0.6um
# Adjust these paths/filenames to match your actual .mat table files
n = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/nfet_03v3.mat')
p = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/pfet_03v3.mat')

L_n = 0.28   # NMOS channel length, um
L_p = 0.6    # PMOS channel length, um

TABLE_REF_W = 5.0  # confirm this matches your table's reference width in um
                     # (your size_lna.py used /5.0 -- adjust if your table
                     #  uses a different reference width, e.g. 1um or 10um)

# ---- Design targets -----------------------------------------------------
# Tail current budget
ID_TAIL_TOTAL = 5e-3       # 4 mA total tail current (2 mA per side)
lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/nfet_03v3.mat')
ID_PER_SIDE   = ID_TAIL_TOTAL / 2   # 2 mA per branch -- flows through every
                                     # device in that branch (telescopic)

# gm/ID targets per device role
GM_ID_INPUT     = 20   # S/A
GM_ID_NMOS_CAS  = 15
GM_ID_PMOS_LOAD = 10
GM_ID_PMOS_CAS  = 12
GM_ID_TAIL      = 15

VGS_SWEEP = np.arange(0.2, 1.5, 0.001)  # sweep range for NMOS (and |VGS| for PMOS)


def find_vgs_for_gmid(table, target_gmid, L, vgs_range=VGS_SWEEP):
    """Sweep VGS, find the VGS at which GM_ID matches target_gmid most closely."""
    gmid_sweep = table.lookup('GM_ID', VGS=vgs_range, L=L)
    gmid_sweep = np.array(gmid_sweep).flatten()
    idx = np.argmin(np.abs(gmid_sweep - target_gmid))
    return vgs_range[idx], gmid_sweep[idx]


def size_device(table, target_gmid, L, ID_required, ref_w=TABLE_REF_W):
    """
n = lk('/foss/designs/Book-on-gm-ID-design/starter_files_open_source_tools/gf180mcuD/simulation/nfet_03v3.mat')
    Given a lookup table, target gm/ID, channel length, and required drain
    current, return: VGS operating point, achieved gm/ID, current density
    (ID/W), required total W, gm at that operating point.
    """
    vgs_op, gmid_achieved = find_vgs_for_gmid(table, target_gmid, L)

    jd = table.lookup('ID_W', VGS=vgs_op, L=L)         # A/um at ref width
    jd = float(np.array(jd).flatten()[0])

    gm_ref = table.lookup('GM', VGS=vgs_op, L=L)        # gm at ref width
    gm_ref = float(np.array(gm_ref).flatten()[0])

    W_required = ID_required / jd                       # total width, um
    gm_total = gm_ref * (W_required / ref_w)             # scale gm to actual W

    return {
        'VGS': vgs_op,
        'gm_ID_achieved': gmid_achieved,
        'jd_uA_per_um': jd * 1e6,
        'W_required_um': W_required,
        'gm_mS': gm_total * 1e3,
        'ID_used': ID_required,
    }


# ---- Run sizing for every device ----------------------------------------
results = {}

results['XM3_XM4_input']     = size_device(n, GM_ID_INPUT,     L_n, ID_PER_SIDE)
results['XM1a_XM1b_nmoscas'] = size_device(n, GM_ID_NMOS_CAS,  L_n, ID_PER_SIDE)
results['XM2_XM1_pmosload']  = size_device(p, GM_ID_PMOS_LOAD, L_p, ID_PER_SIDE)
results['XM2a_XM2b_pmoscas'] = size_device(p, GM_ID_PMOS_CAS,  L_p, ID_PER_SIDE)
results['XM0a_XM0b_tail']    = size_device(n, GM_ID_TAIL,      L_n, ID_TAIL_TOTAL)
# NOTE: tail device carries the FULL tail current (it's the single mirror
# device feeding both branches via the mirror), not per-side -- adjust if
# your topology instead has each tail device carrying ID_PER_SIDE.

# ---- Print summary table --------------------------------------------------
print("\n" + "="*78)
print(f"{'Device':<20}{'VGS(V)':>8}{'gm/ID':>8}{'Jd(uA/um)':>12}{'W_req(um)':>12}{'gm(mS)':>10}")
print("="*78)
for name, r in results.items():
    print(f"{name:<20}{r['VGS']:>8.3f}{r['gm_ID_achieved']:>8.2f}"
          f"{r['jd_uA_per_um']:>12.3f}{r['W_required_um']:>12.2f}{r['gm_mS']:>10.3f}")
print("="*78)

# ---- Suggest finger counts -------------------------------------------------
# Pick a finger width, compute nf, and flag if PMOS nf exceeds the known
# nf<=11 bug boundary found during debugging (at W=2um/L=0.6um).
print("\nSuggested finger splits (W_per_finger, nf, total_W):")
print("-"*78)

finger_w_n = 5.0     # um per finger, NMOS
finger_w_p = 2.0     # um per finger, PMOS -- nf<=11 bug boundary applies here!

for name, r in results.items():
    is_pmos = 'pmos' in name.lower()
    fw = finger_w_p if is_pmos else finger_w_n
    nf_needed = int(np.ceil(r['W_required_um'] / fw))

    if is_pmos and nf_needed > 11:
        n_instances = int(np.ceil(nf_needed / 11))
        nf_per_instance = int(np.ceil(nf_needed / n_instances))
        print(f"{name:<20} W/finger={fw}um -> nf={nf_needed} "
              f"!! EXCEEDS nf<=11 PMOS BUG BOUNDARY !!")
        print(f"{'':<20} -> split into {n_instances} parallel instances "
              f"of nf={nf_per_instance} each "
              f"(total W={n_instances*nf_per_instance*fw:.1f}um)")
    else:
        print(f"{name:<20} W/finger={fw}um -> nf={nf_needed} "
              f"(total W={nf_needed*fw:.1f}um) -- OK")

print("\nNOTE: Vsb assumed 0 for all devices (first-pass approximation,")
print("documented limitation -- see design log).")
print("NOTE: Confirm TABLE_REF_W matches your actual .mat table reference width.")

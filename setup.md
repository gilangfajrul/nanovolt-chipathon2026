# NanoVolt — Team Setup & Workflow Guide

Welcome to **NanoVolt** (SSCS Chipathon 2026, Low-Field MRI Receiver Front-End, GF180MCU).

This page takes you from *nothing installed* to *committing your block to the team repo*.
It assumes **no prior GitHub or EDA experience** — just follow the steps in order.
If you already know git and the design flow, jump to [For experienced users](#5-for-experienced-users-the-short-version).

> **What you'll have at the end:** Docker + the open-source EDA tools running, this
> repo cloned on your machine, the xschem/ngspice/magic environment open, and your
> own branch where you can safely commit without breaking anyone else's work.

---

## At a glance

| Step | You do it… | Section |
|------|-----------|---------|
| 1. Install Docker + tools image | **once** | [§1](#1-install-docker--the-eda-tools) |
| 2. Set up GitHub + clone the repo | **once** | [§2](#2-get-the-repo-onto-your-machine) |
| 3. Launch the design environment | **every session** | [§3](#3-launch-the-design-environment) |
| 4. Commit & push your work | **every time you make progress** | [§4](#4-the-daily-git-workflow) |

---

## 1. Install Docker + the EDA tools

All our tools (xschem, ngspice, magic, klayout, …) live inside **one Docker image**, so you
don't install them one by one. The Chipathon organizers already wrote a step-by-step,
screenshot-by-screenshot guide — **use theirs, don't reinvent it:**

- 🐧 **Linux:** [sscs-chipathon-2026 / Install Docker (Linux)](https://github.com/sscs-ose/sscs-chipathon-2026/blob/main/docs/install_instructions/Linux/install_docker_desktop.md)
- 🪟 **Windows:** [sscs-chipathon-2026 / Install Docker (Windows)](https://github.com/sscs-ose/sscs-chipathon-2026/blob/main/docs/install_instructions/Windows/install_docker_desktop.md)
- ℹ️ Background on the toolbox: [IIC-OSIC-TOOLS resources](https://github.com/sscs-ose/sscs-chipathon-2026/tree/main/resources/IIC-OSIC-TOOLS)

Stop when you have **Docker installed and running** (the install guide ends by pulling the
image — you can let it, but our launch script in §3 will pull the right one automatically if
you skip that part). You do **not** need to memorize any Docker commands.

> 💡 You don't have to pre-pull anything. Our `start_chipathon_x.sh` (see §3) auto-pulls the
> correct image `hpretl/iic-osic-tools:chipathon26` the first time you run it.

---

## 2. Get the repo onto your machine

### 2a. Make a GitHub account + set up SSH (once)

1. Create a free account at <https://github.com> and send your username to **Gilang** so he can
   add you as a **collaborator** on the team repo (you need this to push).
2. Set up an SSH key so you can push without typing a password every time. Follow GitHub's
   official 2-step guide (copy-paste, ~5 min):
   - [Generate a new SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
   - [Add the key to your GitHub account](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
3. Test it: `ssh -T git@github.com` → you should see *"Hi <username>! You've successfully authenticated"*.

Set your name/email so your commits are attributed to you (once, on your machine):
```bash
git config --global user.name  "Your Name"
git config --global user.email "your_github_email@example.com"
```

### 2b. Clone the repo

Clone it **next to your other EDA designs** (the launch scripts expect to live one level under a
`designs/` folder that gets mounted into the container):

```bash
mkdir -p ~/eda/designs
cd ~/eda/designs
git clone git@github.com:gilangfajrul/nanovolt-chipathon2026.git
cd nanovolt-chipathon2026
```

> If `git@github.com:` fails, your SSH key isn't set up yet — go back to step 2a.

---

## 3. Launch the design environment

From the repo folder, start the container. **Two ways — pick one:**

**A) Native window (Linux, recommended — fastest):**
```bash
./start_chipathon_x.sh
```
This pulls the image the first time, starts the container, and opens an X11 desktop. Your tools
appear as normal windows.

**B) Browser / VNC (Windows, macOS, or if X11 gives you trouble):**
```bash
DOCKER_TAG=chipathon26 ./start_chipathon_vnc.sh
```
Then open the URL it prints in your browser. ⚠️ **Set `DOCKER_TAG=chipathon26` exactly as shown** —
without it, the VNC script tries to pull a *different* image (a separate ~25 GB download you don't
need). The variable forces it to reuse the same image as the X script.

Inside the container your work lives under **`/foss/designs/nanovolt-chipathon2026/`**. The analog
blocks are in `designs/libs/core_analog/`.

**Where to start designing:**
- Your block: `designs/libs/core_analog/<your-block>/`
- Worked example to copy from: the **5T-OTA reference** in `designs/libs/core_analog/ota_5t/`
- How-to docs already in this repo: [`docs/schematic_workflow.md`](docs/schematic_workflow.md),
  [`docs/layout_workflow.md`](docs/layout_workflow.md), [`docs/troubleshooting.md`](docs/troubleshooting.md)

---

## 4. The daily git workflow

This is the part that keeps us from stepping on each other. **Read it once, then use the
cheat-sheet at the bottom.** The design below is built so that, if you follow it, you will almost
never hit a merge conflict.

### How we're organized

- We all share **one repo** (this one). `main` is the **integration branch** — the always-working
  version of the chip.
- **Nobody commits to `main` directly.** You work on **your own branch**, then open a
  *Pull Request (PR)* to merge into `main`. Gilang reviews and merges.
- **Each person owns one block (one folder).** This is the secret to avoiding conflicts: git only
  conflicts when two people edit *the same lines of the same file*. If you only ever touch your own
  block's folder, you're physically separated from everyone else's changes.

| Block | Folder | Branch name | Owner |
|-------|--------|-------------|-------|
| LNA | `designs/libs/core_analog/lna/` | `lna` | _fill in_ |
| PGA + AAF | `designs/libs/core_analog/pgaaaf/` | `pgaaaf` | _fill in_ |
| SAR ADC | `designs/libs/core_analog/saradc/` | `saradc` | _fill in_ |
| Bias / references | `designs/libs/core_analog/bias/` | `bias` | _fill in_ |
| Top-level / chip integration (`src/`, `librelane/`) | — | `main` via Gilang | Gilang |

### One-time, per person: create your branch

```bash
git checkout main
git pull                       # get the latest team code
git checkout -b <your-branch>  # e.g.  git checkout -b saradc
git push -u origin <your-branch>
```

### Every working session

```bash
# 1. start from the latest team code
git checkout main
git pull

# 2. switch to your branch and bring it up to date
git checkout <your-branch>
git merge main                 # pull the team's latest into your branch

# 3. ... do your design work (only inside your own block folder!) ...

# 4. save your work
git add designs/libs/core_analog/<your-block>     # add only your folder
git commit -m "saradc: size the comparator input pair"   # short, clear message
git push                       # upload your branch to GitHub
```

### When your block hits a milestone: open a Pull Request

1. Go to the repo on GitHub → it will show a **"Compare & pull request"** button for your branch.
2. Set base = `main`, compare = `<your-branch>`, write a one-line summary, click **Create pull request**.
3. Tag **Gilang** for review. He merges it into `main`. Done — your work is now part of the chip.

You keep using the *same* branch after a PR is merged; just `git merge main` again next session.

### The 8 rules that keep us conflict-free

1. **Stay in your block folder.** Don't edit other blocks, `src/`, `librelane/`, `Makefile`,
   `flake.nix`, or `ip/` — those belong to the integrator.
2. **Never commit straight to `main`.** Always your branch → PR.
3. **Pull/merge `main` into your branch at the start of each session** (and before opening a PR),
   so you're never working against stale code.
4. **Don't commit generated junk** — simulation output, `*.raw`, `runs/`, `final/`, `sim_build/`,
   `__pycache__/`, `*.lyrdb`. These are already in `.gitignore`; just don't force-add them.
5. **Notebooks:** before committing a `.ipynb`, do **Kernel → Restart & Clear All Outputs**. Output
   cells create huge, conflict-prone diffs.
6. **Don't regenerate-and-commit the shared sizing tables** in `designs/Sizing/*.mat.gz`. They're
   large binary files that conflict badly — treat them as read-only/shared (owned by Gilang). Ask
   before touching them.
7. **Commit small and often**, push at the end of each day. Small commits = small, easy merges.
8. **If you hit a conflict, stop and ask in the group chat.** Never `git push --force`.

---

## 5. For experienced users — the short version

Not everyone here is a beginner. **If you're comfortable with git, use whatever workflow you
prefer** — fork-and-PR, rebase instead of merge, multiple feature branches, etc. We only ask you to
respect three hard rules so integration stays clean:

1. **Never push to `main`.** It's the integration branch; merges happen via PR.
2. **Keep your changes scoped to your block.** Touching shared infra (`src/`, `librelane/`,
   `Makefile`, `flake.nix`, `ip/`) is the integrator's job — coordinate first.
3. **Don't commit generated artifacts or the `designs/Sizing/*.mat.gz` binaries.**

Everything else — branch naming, rebase vs merge, how often you commit — is your call.

---

## 6. Cheat sheet

```bash
# --- once ---
ssh -T git@github.com                         # verify SSH works
git clone git@github.com:gilangfajrul/nanovolt-chipathon2026.git
git checkout -b <your-branch>                 # e.g. saradc
git push -u origin <your-branch>

# --- launch tools (every session) ---
./start_chipathon_x.sh                        # Linux native
DOCKER_TAG=chipathon26 ./start_chipathon_vnc.sh   # browser/VNC

# --- save work (every session) ---
git checkout main && git pull                 # get latest
git checkout <your-branch> && git merge main  # update your branch
git add designs/libs/core_analog/<your-block>
git commit -m "block: what you changed"
git push

# --- check status anytime ---
git status            # what changed / what branch am I on
git branch            # list branches, * = current
git log --oneline -5  # recent history
```

## 7. Stuck?

1. Check [`docs/troubleshooting.md`](docs/troubleshooting.md).
2. Search the [Chipathon FAQ](https://github.com/sscs-ose/sscs-chipathon-2026/blob/main/FAQ/README.md).
3. Ask in the team chat — paste the **exact command** and the **full error message**.

Welcome aboard, and happy designing. 🔬⚡

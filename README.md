# 🧪 Unit Operations & Transport Phenomena in Python

Welcome to this repository! Here, you will find Python projects, calculations, and simulations focused on **Unit Operations**, **Fluid Mechanics**, and **Transport Phenomena** applied to Chemical Engineering.

---

## 📌 Featured Projects

### 🚰 PumpLine Calc — Piping & Pumping System Simulator
A simulation tool designed to model industrial pumping lines, calculate head losses, determine operating points, and evaluate cavitation risks.

**Key Technical Features:**
* **Flow Regime Classification:** Automatic identification of Laminar, Transition, and Turbulent flow based on the Reynolds Number ($Re$).
* **Friction Factor Calculation:** Implementation of the Swamee-Jain approximation for turbulent flow in rough pipes.
* **Head Loss Analysis:** Determination of distributed head loss (Darcy-Weisbach) and localized head losses across valves and fittings ($K$-factor method).
* **Pump Curve Fitting:** Polynomial regression ($H_b(Q) = a - bQ^2$) applied to manufacturer catalog data.
* **Operating Point Solver:** Numerical determination of the intersection between the System Head Curve ($H_{sys}$) and the Pump Curve ($H_b$).
* **NPSH & Cavitation Assessment:** Evaluation of Available Net Positive Suction Head ($NPSH_a$) to prevent cavitation.

---

## 🛠️ Tech Stack & Dependencies
* **Python 3.x**
* **NumPy** & **SciPy** (Numerical methods, polynomial fitting, root finding)
* **Matplotlib** (Data visualization and system curve plotting)

---

## 🚀 Future Expansions
- [ ] **Heat Transfer:** Double-pipe and shell-and-tube heat exchanger sizing ($\text{LMTD}$ and $\epsilon\text{-NTU}$ methods).
- [ ] **Separation Processes:** Automated McCabe-Thiele diagram generator for binary distillation.
- [ ] **Chemical Reaction Engineering:** PFR and CSTR performance simulations.

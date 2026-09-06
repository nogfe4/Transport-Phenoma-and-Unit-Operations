### *Transport Phenomena & Unit Operations in Python & Scilab* 🧪⚙️

---
![Python](https://img.shields.io/badge/Python-3.8%2B-blue)
![Jupyter](https://img.shields.io/badge/Jupyter-Notebook-orange) 
![Status](https://img.shields.io/badge/Status-Em%20Andamento-yellow)
---


## **[PT]**:

###  Sobre o Repositório
Este repositório é dedicado ao desenvolvimento de rotinas computacionais, algoritmos numéricos e simulações focadas em **Fenômenos de Transporte** (Mecânica dos Fluidos, Transferência de Calor e Transferência de Massa), **Operações Unitárias** e **Engenharia de Reações Químicas**.

O objetivo principal é integrar os conceitos teóricos da Engenharia Química à aplicação prática por meio de linguagens de programação como **Python** e **Scilab**.

---

### Estrutura do Repositório

```text
Transport-Phenoma-Unit-Operations/
├── README.md
└── PumpLine_Calc/
    ├── Distributed_Head_Loss/
    │   ├── 01_perda_carga_distribuida.ipynb
    │   ├── 01_perda_de_carga_distribuida.py
    │   └── 01_perda_de_carga_distribuida.sce
    ├── Minor_Head_Loss/             <-- (Em desenvolvimento: Válvulas e Conexões)
    ├── System_Pump_Curve/           <-- (Planejado: Ponto de Operação de Bombas)
    └── NPSH_Cavitation/             <-- (Planejado: Análise de NPSH e Cavitação)
```

---

###  Projetos e Módulos

#### [PumpLine Calc](./PumpLine_Calc/) — Simulador de Linhas de Recalque e Bombeamento

Ferramenta modular projetada para calcular perdas de carga distribuídas e localizadas em tubulações industriais, ajustar curvas de bombas centrífugas, determinar pontos de operação e avaliar riscos de cavitação.

1. **[Perda de Carga Distribuída (`/Distributed_Head_Loss`)](./PumpLine_Calc/Distributed_Head_Loss/)**
   - **Fundamentos:** Classificação do regime de escoamento via Número de Reynolds ($Re$), cálculo do fator de atrito de Darcy ($f$) e aplicação da Equação de Swamee-Jain para escoamento turbulento em tubos rugosos.
   - **Implementações:** Disponível em Jupyter Notebook (`.ipynb`), script Python (`.py`) e script Scilab (`.sce`).

2. **Perda de Carga Localizada (`/Minor_Head_Loss`)** *(Em desenvolvimento)*
   - Avaliação de perdas de carga singulares em válvulas, joelhos e conexões utilizando o método dos coeficientes de resistência (Fatores $K$).

3. **Curva do Sistema e Ajuste de Bombas (`/System_Pump_Curve`)** *(Planejado)*
   - Regressão polinomial de dados de catálogo de bombas ($H_b = a - bQ^2$) e determinação numérica do ponto de operação ($H_{sis} = H_b$).

4. **NPSH e Cavitação (`/NPSH_Cavitation`)** *(Planejado)*
   - Determinação do $NPSH$ Disponível ($NPSH_a$) na sucção para prevenção de cavitação em turbomáquinas.

---

###  ROADMAP — Expansões Futuras

- [x] **Mecânica dos Fluidos & Escoamento de Fluidos:** Perda de carga distribuída, perdas localizadas e ponto de operação de bombas.
- [ ] **Transferência de Calor:**
  - Dimensionamento de Trocadores de Calor (Tubo Duplo e Casca e Tubos) pelos métodos MLDT e $\epsilon$-NUT.
  - Cálculo de isolamento térmico e raio crítico.
- [ ] **Transferência de Massa & Processos de Separação:**
  - Construção automatizada do Diagrama de McCabe-Thiele para destilação binária.
  - Dimensionamento de colunas de absorção e esgotamento via métodos de $NUT \times HUT$.
- [ ] **Engenharia de Reações Químicas (Cálculo de Reatores):**
  - Modelagem e integração numérica de perfis de conversão em reatores PFR e CSTR não isotérmicos.
  - Análise de seletividade e rendimento para reações múltiplas.
- [ ] **Métodos Numéricos Aplicados à Engenharia Química:**
  - Solução de sistemas de equações algébricas não lineares e equações diferenciais ordinárias/parciais (EDOs/EDPs).

---

### Tecnologias Utilizadas

- **Python 3.x** (`Jupyter Notebook`, `NumPy`, `SciPy`, `Matplotlib`)
- **Scilab** (Computação numérica em ambiente aberto)




------


## **[EN]**:

###  About The Repository

This repository is dedicated to the development of computational routines, numerical algorithms, and engineering simulations focused on **Transport Phenomena** (Fluid Mechanics, Heat Transfer, and Mass Transfer), **Unit Operations**, and **Chemical Reaction Engineering**.

The primary objective is to bridge theoretical Chemical Engineering concepts with practical computational tools using **Python** and **Scilab**.

---

### Repository Structure

```text
Transport-Phenoma-Unit-Operations/
├── README.md
└── PumpLine_Calc/
    ├── Distributed_Head_Loss/
    │   ├── 01_perda_carga_distribuida.ipynb
    │   ├── 01_perda_de_carga_distribuida.py
    │   └── 01_perda_de_carga_distribuida.sce
    ├── Minor_Head_Loss/             <-- (In Progress: Valves & Fittings)
    ├── System_Pump_Curve/           <-- (Planned: Pump Operating Point)
    └── NPSH_Cavitation/             <-- (Planned: NPSH & Cavitation Assessment)
```

---

###  Projects and Modules

####  [PumpLine Calc](./PumpLine_Calc/) — Piping & Pumping System Simulator

A modular engineering tool designed to compute major and minor friction losses in industrial piping systems, fit centrifugal pump curves, determine operating points, and evaluate cavitation risks.

1. **[Distributed Head Loss (`/Distributed_Head_Loss`)](./PumpLine_Calc/Distributed_Head_Loss/)**
   - **Fundamentals:** Flow regime classification using Reynolds Number ($Re$), Darcy-Weisbach friction factor ($f$), and explicit Swamee-Jain equation for turbulent flow in rough pipes.
   - **Implementations:** Available in Jupyter Notebook (`.ipynb`), Python script (`.py`), and Scilab script (`.sce`).

2. **Minor Head Loss (`/Minor_Head_Loss`)** *(In Progress)*
   - Evaluation of localized losses in valves, elbows, and fittings using resistance coefficients ($K$-factors).

3. **System & Pump Curve Fitting (`/System_Pump_Curve`)** *(Planned)*
   - Polynomial regression of manufacturer catalog data ($H_b = a - bQ^2$) and root-finding for system-pump curve intersection.

4. **NPSH & Cavitation (`/NPSH_Cavitation`)** *(Planned)*
   - Determination of Available Net Positive Suction Head ($NPSH_a$) to prevent cavitation damage.

---

###  ROADMAP — Future Expansions

- [x] **Fluid Mechanics & Fluid Flow:** Distributed head loss, minor losses, and pump operating points.
- [ ] **Heat Transfer:**
  - Double-pipe and shell-and-tube heat exchanger sizing ($\text{LMTD}$ and $\epsilon\text{-NTU}$ methods).
  - Thermal insulation and critical radius calculation.
- [ ] **Mass Transfer & Separation Processes:**
  - Automated McCabe-Thiele diagram generator for binary distillation.
  - Sizing of absorption and stripping columns using $NTU \times HTU$ methods.
- [ ] **Chemical Reaction Engineering (Kinetics & Reactor Design):**
  - Numerical modeling of conversion and temperature profiles in non-isothermal PFR and CSTR reactors.
  - Selectivity and yield optimization for multiple reaction systems.
- [ ] **Numerical Methods in Chemical Engineering:**
  - Solvers for non-linear algebraic systems and ordinary/partial differential equations (ODEs/PDEs).

---

###  Tech Stack

- **Python 3.x** (`Jupyter Notebook`, `NumPy`, `SciPy`, `Matplotlib`)
- **Scilab** (Open-source numerical computation platform)

---

##  Author

- **Fernando Nogueira** — Chemical Engineering Student
- GitHub: [@nogfe4](https://github.com/nogfe4)

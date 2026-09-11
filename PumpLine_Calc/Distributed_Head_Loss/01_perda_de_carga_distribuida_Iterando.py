"""
Calculadora de Perda de Carga em Tubulações
--------------------------------------------

Ferramenta desenvolvida em python para cálculo de perda de carga distribuída em
escoamento de fluídos em tubulações, aplicando os fundamentos da Mecânica dos Fluidos
e Operações Unitárias.

A partir de dados de entrada (vazão volumétrica, massa específica,
diâmetro, viscosidade dinâmica, rugosidade absoluta e comprimento da
tubulação), o script calcula:

    - Área da seção transversal e velocidade de escoamento
    - Vazão mássica
    - Número de Reynolds
    - Classificação do regime de escoamento (laminar, transição
      ou turbulento)
    - Fator de atrito (Hagen-Poiseuille para regime laminar;
      aproximação de Swamee-Jain para transição e Iterações usando Colebrook-White (Iterações com Newton Raphson)
    - Perda de carga distribuída (equação de Darcy-Weisbach)
    - Queda de pressão correspondente (kPa)


Author: @nogfe4

"""

# Importando bibliotecas necessárias:
import math as mt

# ============================== FORMATAÇÃO ==============================
# Formatação da saída do código:
Largura = 60

def cabecalho(texto, char="="):
  print(char * Largura)
  print(f" {texto} ".center(Largura, char))
  print(char * Largura)

def linha_dado(rotulo, valor, unidade=""):
  text_valor = f"{valor} {unidade}".strip()
  print(f"│ {rotulo:<30}│ {text_valor:>25} │")

def sep_tabela(char="─"):
  print("├" + char * 32 + "┼" + char * 27 + "┤")

def borda_tabela(topo=True):
  canto_esq = "│" if topo else "├"
  canto_dir = "│" if topo else "┤"
  print(canto_esq + "─" * 32 + ("┬" if topo else "┴") + "─" * 27 + canto_dir)

# ============================== CABEÇALHO ==============================
cabecalho("CALCULADORA DE PERDA DE CARGA")
cabecalho("MecFlu e Operações Unitárias", char="-")
print(f"{'Autor: @nogfe4':^{Largura}}")
print("=" * Largura)

# ============================== ENTRADA ==============================

# Organizando os dados de entrada:

def entrada_correta(mes):
  while True:
    try:
      valor = float(input(mes))

      if valor <= 0:
        print("ATENÇÃO! O valor deve ser maior que zero.")
      else:
        return valor

    except ValueError:
      print("ENTRADA INVÁLIDA! Digite um número.")

# Input dos dados
print()
cabecalho("DADOS DE ENTRADA")
print()


q       = entrada_correta(" ➤ Vazão Volumétrica [m³/s]: ")
rho     = entrada_correta(" ➤ Massa Específica [kg/m³]: ")
D       = entrada_correta(" ➤ Diâmetro da Tubulação [m]: ")
mi      = entrada_correta(" ➤ Viscosidade Dinâmica [Pa.s]: ")
epsilon = entrada_correta(" ➤ Rugosidade Absoluta [m]: ")
L       = entrada_correta(" ➤ Comprimento da Tubulação [m]: ")

# ============================== CÁLCULOS ==============================

# Área da seção transversal da tubulação:
A = mt.pi*(D**2/4)

# Vazão Mássica:
w = q * rho

# Velocidade do flúido:
v = (q /A)

# Número de Reynolds:
def calc_rey(D, v, rho, mi):
  return (D* v *rho / mi)

Re = calc_rey(D, v, rho, mi)
g = 9.81

# Cálculo da Rugosidade Relativa:
rugosidade_relativa = epsilon / D

#Denominador Logaritmo:
log = mt.log10((rugosidade_relativa / 3.7) + (5.74 / (Re ** 0.9)))

# Iteração: 
def cole(f, rugosidade_relativa, Re):
  logar = mt.log10((rugosidade_relativa / 3.7) + (2.51 / (Re *mt.sqrt(f))))
  return (1/mt.sqrt(f))+2*logar

def cole_newton(Re, rugosidade_relativa, itmax=1000, tol=1e-6):
  f = 0.316*(Re**(-0.25))
  
  def der_cole( f, h=1e-6):
    return (cole(f + h, rugosidade_relativa, Re) - cole(f - h, rugosidade_relativa, Re)) / (2 * h)

  for i in range(itmax):
    F = cole(f, rugosidade_relativa, Re)
    dF = der_cole(f)
    passo = F / dF
    f_new = f - passo 

    if abs(f_new - f) < tol:
      return f_new

    f = f_new
    
  return f

warning = ""

# Cálculo de classificação do tipo de regime e fator de atrito:
if Re < 2300:
    regime = "Regime Laminar"
    f = 64 / Re

elif Re <= 4000:
    regime = "Regime de Transição"
    f = 0.25 / (log ** 2)
    warning = "Atenção: resultado na região de transição."

else:
    regime = "Regime Turbulento"
    f = cole_newton(Re, rugosidade_relativa)


# Cálculo da perda de carga:
hf = f * ((L*(v**2)) / (D*2*g))

# Queda de Pressão:
delta_P = rho * g * hf
delta_P_kPa = delta_P / 1000

# ============================== SAÍDA ==============================
print()
cabecalho("REGIME DE ESCOAMENTO")
print(f"{regime: ^{Largura}}")

if warning:
  print(f"{warning: ^{Largura}}")

print("=" * Largura)

print()
cabecalho("GRANDEZAS CALCULADAS")
borda_tabela(topo=True)
linha_dado("Área da Tubulação", f"{A:.3f}", "m²")
sep_tabela()
linha_dado("Velocidade", f"{v:.3f}", "m/s")
sep_tabela()
linha_dado("Vazão Mássica", f"{w:.3f}", "kg/s")
borda_tabela(topo=False)

print()
cabecalho("RESULTADOS")
print()
borda_tabela(topo=True)
linha_dado("Número de Reynolds", f"{Re:.1f}")
sep_tabela()
linha_dado("Fator de Atrito", f"{f:.4f}")
sep_tabela()
linha_dado("Perda de Carga (hf)", f"{hf:.2f}", "m")
borda_tabela(topo=False)
linha_dado("Queda de Pressão (ΔP)", f"{delta_P_kPa:.2f}", "kPa")
borda_tabela(topo=False)
print()


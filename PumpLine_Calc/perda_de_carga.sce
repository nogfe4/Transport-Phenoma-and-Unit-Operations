// ============================================================
// Calculadora de Perda de Carga em Tubulacoes
// ------------------------------------------------------------
// Ferramenta desenvolvida em Scilab para calculo de perda de
// carga distribuida em escoamento de fluidos em tubulacoes,
// aplicando os fundamentos da Mecanica dos Fluidos e Operacoes
// Unitarias.
//
// A partir de dados de entrada (vazao volumetrica, massa
// especifica, diametro, viscosidade dinamica, rugosidade
// absoluta e comprimento da tubulacao), o script calcula:
//
//     - Area da secao transversal e velocidade de escoamento
//     - Vazao massica
//     - Numero de Reynolds
//     - Classificacao do regime de escoamento (laminar,
//       transicao ou turbulento)
//     - Fator de atrito (Hagen-Poiseuille para regime laminar;
//       aproximacao de Swamee-Jain/Colebrook para turbulento)
//     - Perda de carga distribuida (equacao de Darcy-Weisbach)
//     - Queda de pressao correspondente (kPa)
//
// Autor: @nogfe4
// ============================================================

clear;
clc;

Largura = 60;

// ============================== FORMATACAO ==============================

// Repete um caractere "car" n vezes (equivalente a char * n em Python)
function s = repete(car, n)
    if n <= 0 then
        s = "";
    else
        s = part(car, ones(1, n));
    end
endfunction

// Centraliza um texto dentro de uma largura, preenchendo com "char"
// (equivalente a texto.center(Largura, char) em Python)
function s = centraliza(texto, largura, char)
    if argn(2) < 3 then
        char = " ";
    end
    n = length(texto);
    total = largura - n;
    if total <= 0 then
        s = texto;
        return;
    end
    esq = floor(total / 2);
    dir = total - esq;
    s = repete(char, esq) + texto + repete(char, dir);
endfunction

// Imprime um cabecalho estilo "==== TEXTO ====" com bordas acima/abaixo
function cabecalho(texto, char)
    if argn(2) < 2 then
        char = "=";
    end
    mprintf("%s\n", repete(char, Largura));
    mprintf("%s\n", centraliza(" " + texto + " ", Largura, char));
    mprintf("%s\n", repete(char, Largura));
endfunction

// Imprime uma linha de tabela: rotulo alinhado a esquerda, valor a direita
function linha_dado(rotulo, valor, unidade)
    if argn(2) < 3 then
        unidade = "";
    end
    text_valor = valor;
    if unidade <> "" then
        text_valor = valor + " " + unidade;
    end

    rot = rotulo;
    while length(rot) < 30
        rot = rot + " ";
    end

    tv = text_valor;
    while length(tv) < 25
        tv = " " + tv;
    end

    mprintf("│ %s│ %s │\n", rot, tv);
endfunction

function sep_tabela(char)
    if argn(2) < 1 then
        char = "─";
    end
    mprintf("├%s┼%s┤\n", repete(char, 32), repete(char, 27));
endfunction

function borda_tabela(topo)
    if argn(2) < 1 then
        topo = %t;
    end
    if topo then
        canto_esq = "┌"; canto_dir = "┐"; meio = "┬";
    else
        canto_esq = "└"; canto_dir = "┘"; meio = "┴";
    end
    mprintf("%s%s%s%s%s\n", canto_esq, repete("─", 32), meio, repete("─", 27), canto_dir);
endfunction

// ============================== CABECALHO ==============================

cabecalho("CALCULADORA DE PERDA DE CARGA");
cabecalho("MecFlu e Operacoes Unitarias", "-");
mprintf("%s\n", centraliza("Autor: @nogfe4", Largura));
mprintf("%s\n", repete("=", Largura));

// ============================== ENTRADA ==============================

// Le um valor numerico validado (> 0), repetindo a pergunta se invalido.
// Equivalente a entrada_correta() em Python.
function valor = entrada_correta(msg)
    while %t
        txt = input(msg, "string");
        valor = evstr(txt, %nan);

        if isnan(valor) then
            mprintf("ENTRADA INVALIDA! Digite um numero.\n");
        elseif valor <= 0 then
            mprintf("ATENCAO! O valor deve ser maior que zero.\n");
        else
            return;
        end
    end
endfunction

mprintf("\n");
cabecalho("DADOS DE ENTRADA");
mprintf("\n");

q       = entrada_correta(" > Vazao Volumetrica [m3/s]: ");
rho     = entrada_correta(" > Massa Especifica [kg/m3]: ");
D       = entrada_correta(" > Diametro da Tubulacao [m]: ");
mi      = entrada_correta(" > Viscosidade Dinamica [Pa.s]: ");
epsilon = entrada_correta(" > Rugosidade Absoluta [m]: ");
L       = entrada_correta(" > Comprimento da Tubulacao [m]: ");

// ============================== CALCULOS ==============================

// Area da secao transversal da tubulacao:
A = %pi * (D^2 / 4);

// Vazao Massica:
w = q * rho;

// Velocidade do fluido:
v = q / A;

// Numero de Reynolds:
function Re = calc_rey(D, v, rho, mi)
    Re = (D * v * rho / mi);
endfunction

Re = calc_rey(D, v, rho, mi);
g = 9.81;

// Calculo da Rugosidade Relativa:
rugosidade_relativa = epsilon / D;

// Denominador (Swamee-Jain):
logar = log10((rugosidade_relativa / 3.7) + (5.74 / (Re ^ 0.9)));

warning_msg = "";

// Classificacao do regime e calculo do fator de atrito:
if Re < 2300 then
    regime = "Regime Laminar";
    f = 64 / Re;
elseif Re <= 4000 then
    regime = "Regime de Transicao";
    f = 0.25 / (logar ^ 2);
    warning_msg = "Atencao: resultado na regiao de transicao.";
else
    regime = "Regime Turbulento";
    f = 0.25 / (logar ^ 2);
end

// Perda de carga distribuida:
hf = f * ((L * (v^2)) / (D * 2 * g));

// Queda de Pressao:
delta_P = rho * g * hf;
delta_P_kPa = delta_P / 1000;

// ============================== SAIDA ==============================

mprintf("\n");
cabecalho("REGIME DE ESCOAMENTO");
mprintf("%s\n", centraliza(regime, Largura));

if warning_msg <> "" then
    mprintf("%s\n", centraliza(warning_msg, Largura));
end

mprintf("%s\n", repete("=", Largura));

mprintf("\n");
cabecalho("GRANDEZAS CALCULADAS");
borda_tabela(%t);
linha_dado("Area da Tubulacao", msprintf("%.6f", A), "m2");
sep_tabela();
linha_dado("Velocidade", msprintf("%.4f", v), "m/s");
sep_tabela();
linha_dado("Vazao Massica", msprintf("%.4f", w), "kg/s");
borda_tabela(%f);

mprintf("\n");
cabecalho("RESULTADOS");
mprintf("\n");
borda_tabela(%t);
linha_dado("Numero de Reynolds", msprintf("%.2f", Re));
sep_tabela();
linha_dado("Fator de Atrito", msprintf("%.4f", f));
sep_tabela();
linha_dado("Perda de Carga (hf)", msprintf("%.4f", hf), "m");
sep_tabela();
linha_dado("Queda de Pressao (dP)", msprintf("%.4f", delta_P_kPa), "kPa");
borda_tabela(%f);
mprintf("\n");

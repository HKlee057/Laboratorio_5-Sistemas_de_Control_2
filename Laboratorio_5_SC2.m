%% Laboratorio 5
%% Datos
% Hector Alejandro Kl�e Gonz�lez - 17118
% Juan Diego Castillo Amaya - 17074
% Secci�n 11 
% Sistemas de Control 2
%% Procedimiento
syms s M1 M2 k ks fv fs F
%{
M1 = 320;
M2 = 2500;
k = 500000;
ks = 80000;
fv = 15020;
fs = 350;
F = 500000;
%}

numG1 = 1;
numG2 = ks + (fs*s);
numG3 = numG2;

denG1 = (k + ks) + ((fv + fs)*s) + (M1*(s^2));
denG2 = ks + (fs*s) + (M2*(s^2));
denG3 = denG1;

G1 = numG1 / denG1;
G2 = numG2 / denG2;
G3 = numG3 / denG3;

G_OG = (G1 * G2) / (1 - (G2 * G3));
G_fin = simplify(G_OG);

% ED_sis = ilaplace(G_fin);
load ED.mat ED_sis

%{
% Obtenemos el numerador y denominador
[N, D] = numden(simplifyFraction(G_fin));
% Obtenemos los coeficientes del numerador y denominador
b = fliplr(double(coeffs(N)));
a = fliplr(double(coeffs(D)));
% Normalizamos
b = b / a(1);
a = a / a(1);

G = tf(b, a);
%}
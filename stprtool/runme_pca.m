%% How to PCA
clear all;  close all;  clc;
load hald;
X = ingredients;

%% Principal Component Analysis
% pc: her bir sutunu bir principal component (PC)'tir
% score: her bir PC icin elde edilen temsil yetenegi/score'lar. Her bir
%        sutun bir PC'ye denk duser. Orn. score(:, 4), 4 nolu PC'nin temsil
%        yetenegini soyler. Sayilarin genligi/buyuklugu iyi temsile isaret.
% latent: eigenvalues; ne kadar yuksek o kadar iyi.
[pc, score, latent] = princomp(X);

% ncs: varyansin %98'in altinda kalanlar secilir. Ornegin,
% ncs =
%
%     0.8660
%     0.9789
%     0.9996
%     1.0000
% ise ilk iki PC yeterlidir.
ncs = cumsum(latent)./sum(latent)

%% Residual
figure(1);
subplot(221);
    [residuals, reconstructed] = pcares(X, 1);
    plot(X(:, 1), 'b-o');   hold on;    title('Actual');
    plot(reconstructed(:, 1), 'r-*');   title('Reconstructed with E1');
    legend('Actual', 'Reconstructed');
subplot(222);
    [residuals, reconstructed] = pcares(X, 2);
    plot(X(:, 1), 'b-o');   hold on;    title('Actual');
    plot(reconstructed(:, 1), 'r-*');   title('Reconstructed with E1-2');
    legend('Actual', 'Reconstructed');
subplot(223);
    [residuals, reconstructed] = pcares(X, 3);
    plot(X(:, 1), 'b-o');   hold on;    title('Actual');
    plot(reconstructed(:, 1), 'r-*');   title('Reconstructed with E1-3');
    legend('Actual', 'Reconstructed');
subplot(224);
    [residuals, reconstructed] = pcares(X, 4);
    plot(X(:, 1), 'b-o');   hold on;    title('Actual');
    plot(reconstructed(:, 1), 'r-*');   title('Reconstructed with E1-4');
    legend('Actual', 'Reconstructed');

%% Example: SVM2
% Burada `data`, 2 boyutlu feature ve 2 farkli sinifli 250 veriden
% olusuyor.
clear all;  close all;  clc;

%% train
trn = load('riply_trn');

model = svm2(trn, struct('ker','rbf','arg',2,'C',10));
% model = smo(trn, struct('ker','rbf','arg',2,'C',10));

%% test
tst = load('riply_tst');
yh = svmclass(tst.X, model);

%% Error Metric
y = tst.y;
classperf(y, yh)

figure(1); ppatterns(trn); psvm(model);
figure(2); ppatterns(tst); psvm(model);
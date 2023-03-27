clc;
close ALL;
clear ALL;
%% SOFCI
SOFCI = load('../data/analysis_plot/SOFCI.mat');
SOFCI_LoopGain = SOFCI.Loop;
SOFCI_sens = SOFCI.Sensitivity;
%% Repetitive
Rep50 = load('../data/analysis_plot/Q50_S_rep.mat');
Rep_LoopGain50 = Rep50.Loop_gain;
Rep_sens50 = Rep50.S_RQ;

Rep10 = load('../data/analysis_plot/Q10_S_rep.mat');
Rep_LoopGain10 = Rep10.Loop_gain;
Rep_sens10 = Rep10.S_RQ;

Rep5 = load('../data/analysis_plot/Q5_S_rep.mat');
Rep_LoopGain5 = Rep5.Loop_gain;
Rep_sens5 = Rep5.S_RQ;
%% Repetitive with FF
Repff50 = load('../data/analysis_plot/Q50_S_repff.mat');
Repff_sens50 = Repff50.S_repff;

Repff10 = load('../data/analysis_plot/Q10_S_repff.mat');
Repff_sens10 = Repff10.S_repff;


Repff5 = load('../data/analysis_plot/Q5_S_repff.mat');
Repff_sens5 = Repff5.S_repff;
%% sensitivity plots
% figure 1 : SOFCI vs. Repetitive (Q_50) vs. Rep +ff (Q50)
figure()
subplot(3,1,1)
bodemag(SOFCI_sens)
xlim([1,10000])
ylim([-70,10])
legend("SOFCI",'FontSize',14,'location','best')
grid on

subplot(3,1,2)
bodemag(Rep_sens50)
xlim([1,10000])
ylim([-70,10])
legend("Repetitive (Q_100)",'FontSize',14,'location','best')
grid on

subplot(3,1,3)
bodemag(Repff_sens50)
xlim([1,10000])
ylim([-70,10])
legend("Repetitive + Feedforward (Q_100)",'FontSize',14,'location','best')
grid on
%%
% % Repetitive (Q5) vs Repetitive (Q10) vs Repetitive (Q50)
figure()
subplot(3,1,1)
bodemag(Rep_sens5)
xlim([1,10000])
ylim([-100,45])
legend("Repetitive (Q_10)",'FontSize',14,'location','best')
grid on

subplot(3,1,2)
bodemag(Rep_sens10)
xlim([1,10000])
ylim([-100,45])
legend("Repetitive (Q_20)",'FontSize',14,'location','best')
grid on

subplot(3,1,3)
bodemag(Rep_sens50)
xlim([1,10000])
ylim([-100,45])
legend("Repetitive (Q_100)",'FontSize',14,'location','best')
grid on

%% Repetitive + ff (Q5 vs Q10 vs Q50)
figure
subplot(3,1,1)
bodemag(Repff_sens5)
xlim([1,10000])
ylim([-50,50])
legend("Repetitive + Feedforward (Q_10)",'FontSize',14,'location','best')
grid on

subplot(3,1,2)
bodemag(Repff_sens10)
xlim([1,10000])
ylim([-50,50])
legend("Repetitive + Feedforward (Q_20)",'FontSize',14,'location','best')
grid on

subplot(3,1,3)
bodemag(Repff_sens50)
xlim([1,10000])
ylim([-50,50])
legend("Repetitive + Feedforward (Q_100)",'FontSize',14,'location','best')
grid on

%% Loop Gain plots
figure()
subplot(2,1,1)
bodemag(SOFCI_LoopGain)
legend("SOFCI",'FontSize',14,'location','best')
grid on
subplot(2,1,2)
bodemag(Rep_LoopGain50)
legend("Repetitive (Q_100)",'FontSize',14,'location','best')
grid on
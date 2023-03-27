clc;
clear;
close all;
exp_data = load('../data/result/test_data.mat');
exp_data2 = load("../data/result/test_data2.mat");
sim_data = load('../data/result/sim_data_rep.mat');
sim_data2 = load('../data/result/sim_data_dist.mat');

%% Tri Rep 1Hz Exp 
exp1 = exp_data.data{1};
p1 = exp1{7}; % performance
r1 = exp1{16}; % reference
e1 = exp1{19}; % error
tp1 = p1.Values.Data;
tt1 = p1.Values.Time;
rp1 = r1.Values.Data;
ep1 = e1.Values.Data;

figure(1)
subplot(2,1,1)
plot(tt1,tp1,'b',tt1,rp1,'r:','Linewidth',2)
axis([9.5 20 -0.1 0.5])
legend('experiment','reference')
title('1Hz Triangluar Wave Experiment')

subplot(2,1,2)
plot(tt1,ep1,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')


%% Sq Rep 1Hz Exp 
exp2 = exp_data.data{2};
p2 = exp2{7}; % performance
r2 = exp2{16}; % reference
e2 = exp2{19}; % error
tp2 = p2.Values.Data;
tt2 = p2.Values.Time;
rp2 = r2.Values.Data;
ep2 = e2.Values.Data;

figure(2)
subplot(2,1,1)
plot(tt2,tp2,'b',tt2,rp2,'r:','Linewidth',2)
axis([9.5 20 -0.2 0.6])
legend('experiment','reference')
title('1Hz Square Wave Experiment')

subplot(2,1,2)
plot(tt2,ep2,'b','Linewidth',2)
axis([9.5 20 -0.5 0.5])
legend('error')


%% Sin Rep 1Hz Exp 
exp3 = exp_data.data{3};
p3 = exp3{7}; % performance
r3 = exp3{16}; % reference
e3 = exp3{19}; % error
tp3 = p3.Values.Data;
tt3 = p3.Values.Time;
rp3 = r3.Values.Data;
ep3 = e3.Values.Data;

figure(3)
subplot(2,1,1)
plot(tt3,tp3,'b',tt3,rp3,'r:','Linewidth',2)
axis([9.5 20 -0.1 0.5])
legend('experiment','reference')
title('1Hz Sine Wave Experiment')

subplot(2,1,2)
plot(tt3,ep3,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')


%% Tri Rep 5Hz Exp 
exp4 = exp_data.data{4};
p4 = exp4{7}; % performance
r4 = exp4{16}; % reference
e4 = exp4{19}; % error
tp4 = p4.Values.Data;
tt4 = p4.Values.Time;
rp4 = r4.Values.Data;
ep4 = e4.Values.Data;

figure(4)
subplot(2,1,1)
plot(tt4,tp4,'b',tt4,rp4,'r:','Linewidth',2)
axis([9.5 12 -0.15 0.55])
legend('experiment','reference')
title('5Hz Triangluar Wave Experiment')

subplot(2,1,2)
plot(tt4,ep4,'b','Linewidth',2)
axis([9.5 12 -0.3 0.3])
legend('error')


%% Tri Rep 0.5Hz Exp 
exp5 = exp_data.data{5};
p5 = exp5{7}; % performance
r5 = exp5{16}; % reference
e5 = exp5{19}; % error
tp5 = p5.Values.Data;
tt5 = p5.Values.Time;
rp5 = r5.Values.Data;
ep5 = e5.Values.Data;

figure(5)
subplot(2,1,1)
plot(tt5,tp5,'b',tt5,rp5,'r:','Linewidth',2)
axis([9.5 20 -0.05 0.5])
legend('experiment','reference')
title('0.5Hz Triangluar Wave Experiment')

subplot(2,1,2)
plot(tt5,ep5,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')


%% Tri Rep_only 1Hz Exp 
exp6 = exp_data2.data{1};
p6 = exp6{7}; % performance
r6 = exp6{16}; % reference
e6 = exp6{18}; % error
tp6 = p6.Values.Data;
tt6 = p6.Values.Time;
rp6 = r6.Values.Data;
ep6 = e6.Values.Data;

figure(6)
subplot(2,1,1)
plot(tt6,tp6,'b',tt6,rp6,'r:','Linewidth',2)
axis([9.5 20 -0.05 0.5])
legend('experiment','reference')
title('Wave Experiment with Repetitive Controller only')

subplot(2,1,2)
plot(tt6,ep6,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')

%% Tri FF_only 1Hz Exp 
exp7 = exp_data2.data{2};
p7 = exp7{7}; % performance
r7 = exp7{16}; % reference
e7 = exp7{18}; % error
tp7 = p7.Values.Data;
tt7 = p7.Values.Time;
rp7 = r7.Values.Data;
ep7 = tp7 - rp7;

figure(7)
subplot(2,1,1)
plot(tt7,tp7,'b',tt7,rp7,'r:','Linewidth',2)
axis([9.5 20 -0.05 0.5])
legend('experiment','reference')
title('Triangluar Wave Experiment with FF Controller only')

subplot(2,1,2)
plot(tt7,ep7,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')


%% Tri SOFCI_only 1Hz Exp 
exp8 = exp_data2.data{3};
p8 = exp8{7}; % performance
r8 = exp8{16}; % reference
tp8 = p8.Values.Data;
tt8 = p8.Values.Time;
rp8 = r8.Values.Data;
ep8 = tp8 - rp8;

figure(8)
subplot(2,1,1)
plot(tt8,tp8,'b',tt8,rp8,'r:','Linewidth',2)
axis([9.5 20 -0.05 0.5])
legend('experiment','reference')
title('1Hz Triangluar Wave Experiment with SOFCI only')

subplot(2,1,2)
plot(tt8,ep8,'b','Linewidth',2)
axis([9.5 20 -0.1 0.1])
legend('error')


%% Tri Rep 1Hz Sim 
sim1 = sim_data.data{3};
nl1 = sim1{8}; % nonlinear
l1 = sim1{9}; % linear
r1s = sim1{13}; % ref

snl1 = nl1.Values.Data;
tnl1 = nl1.Values.Time;
sl1 = l1.Values.Data;
sr1 = r1s.Values.Data;
se1 = snl1-sr1;

figure(9)
subplot(2,1,1)
plot(tnl1,snl1,'b',tnl1,sl1,'r',tnl1,sr1,'k:','Linewidth',2)
axis([0.5 10 -0.1 0.5])
legend('Nonlinear','Linear','reference')
title('1Hz Triangluar Wave Simulation')

subplot(2,1,2)
plot(tnl1,se1,'b','Linewidth',2)
axis([0.5 10 -0.1 0.1])
legend('Nonlinear Error')


%% Sq Rep 1Hz Sim 
sim1 = sim_data.data{2};
nl2 = sim1{8}; % nonlinear
l2 = sim1{9}; % linear
r2s = sim1{13}; % ref

snl2 = nl2.Values.Data;
tnl2 = nl2.Values.Time;
sl2 = l2.Values.Data;
sr2 = r2s.Values.Data;
se2 = snl2-sr2;

figure(10)
subplot(2,1,1)
plot(tnl2,snl2,'b',tnl2,sl2,'r',tnl2,sr2,'k:','Linewidth',2)
axis([0.5 10 -0.15 0.55])
legend('Nonlinear','Linear','reference')
title('1Hz Square Wave Simulation')

subplot(2,1,2)
plot(tnl2,se2,'b','Linewidth',2)
axis([0.5 10 -0.5 0.5])
legend('Nonlinear Error')


%% Tri Rep 5Hz Sim 
sim1 = sim_data.data{1};
nl3 = sim1{8}; % nonlinear
l3 = sim1{9}; % linear
r3s = sim1{13}; % ref

snl3 = nl3.Values.Data;
tnl3 = nl3.Values.Time;
sl3 = l3.Values.Data;
sr3 = r3s.Values.Data;
se3 = snl3-sr3;

figure(11)
subplot(2,1,1)
plot(tnl3,snl3,'b',tnl3,sl3,'r',tnl3,sr3,'k:','Linewidth',1.5)
axis([0.5 5 -0.05 0.5])
legend('Nonlinear','Linear','reference')
title('5Hz Triangular Wave Simulation')

subplot(2,1,2)
plot(tnl3,se3,'b','Linewidth',2)
axis([0.5 5 -0.25 0.25])
legend('Nonlinear Error')

%% Tri Rep 0.5Hz Sim 
sim1 = sim_data.data{5};
nl5 = sim1{8}; % nonlinear
l5 = sim1{9}; % linear
r5s = sim1{13}; % ref

snl5 = nl5.Values.Data;
tnl5 = nl5.Values.Time;
sl5 = l5.Values.Data;
sr5 = r5s.Values.Data;
se5 = snl5-sr5;

figure(12)
subplot(2,1,1)
plot(tnl5,snl5,'b',tnl5,sl5,'r',tnl5,sr5,'k:','Linewidth',1.5)
axis([0.5 9 -0.05 0.45])
legend('Nonlinear','Linear','reference')
title('0.5Hz Triangluar Wave Simulation')

subplot(2,1,2)
plot(tnl5,se5,'b','Linewidth',2)
axis([0.5 9 -0.1 0.1])
legend('Nonlinear Error')
%% Sin Rep 1Hz Sim 
sim1 = sim_data.data{4};
nl4 = sim1{8}; % nonlinear
l4 = sim1{9}; % linear
r4s = sim1{13}; % ref

snl4 = nl4.Values.Data;
tnl4 = nl4.Values.Time;
sl4 = l4.Values.Data;
sr4 = r4s.Values.Data;
se4 = snl4-sr4;

figure(13)
subplot(2,1,1)
plot(tnl4,snl4,'b',tnl4,sl4,'r',tnl4,sr4,'k:','Linewidth',1.5)
axis([0.5 10 -0.05 0.45])
legend('Nonlinear','Linear','reference')
title('1Hz Sine Wave Simulation')

subplot(2,1,2)
plot(tnl4,se4,'b','Linewidth',2)
axis([0.5 10 -0.1 0.1])
legend('Nonlinear Error')

%% Tri Rep 1Hz with 5Hz sine dist 
sim2 = sim_data2.data;
nl_d = sim2{8}; % nonlinear
l_d = sim2{9}; % linear
r_d = sim2{13}; % ref
dist = sim2{14};% dist

nl = nl_d.Values.Data;
tnl = nl_d.Values.Time;
l = l_d.Values.Data;
ref = r_d.Values.Data;
err = nl-ref;
dis = dist.Values.Data;

figure(14)
subplot(2,1,1)
plot(tnl,nl,'b',tnl,l,'r',tnl,ref,'k:',tnl,dis,'m:','Linewidth',1.5)
axis([0.5 10 -0.05 0.45])
legend('Nonlinear','Linear','reference','disturbance')
title('1Hz Sine Wave Simulation with dist')

subplot(2,1,2)
plot(tnl,err,'b','Linewidth',2)
axis([0.5 10 -0.1 0.1])
legend('Nonlinear Error')












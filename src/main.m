clc;
close ALL;
clear ALL;
%%
% digital control sampling time
Ts = 0.001; 

% load all the parameters from id
load_parameters;

% define control system variable 
s=tf('s');   
z=tf('z',Ts);
% some intermediate variables
kapa_2=V_s_2/K_m_2;
tau_2=J_pend_2*R_2/K_m_2^2;
F_rotorred=R_2/(K_m_2*V_s_2);

% Equivalent torsional pring constant Nm/radian
Kc = 10; 
% get A B C D of the physical plant and form the discrete transfer function
A1 = [0 1; -K_tot_1/J_pend_1 -1/tau_1];
B1 = [0; kapa_1/tau_1];
C1 = [1 0];
Bd1 = [0; 1/J_pend_1];
A2 = [0 1; -K_tot_2/J_pend_2 -1/tau_2];
B2 = [0; kapa_2/tau_2];
C2 = [1 0];
Bd2 = [0; 1/J_pend_2];
A_double = [A1-Kc*Bd1*C1 Kc*Bd1*C1; Kc*Bd2*C2 A2-Kc*Bd2*C2];
B_double = [zeros(2, 1); B2];
C_double = [C1 zeros(1, 2)];
G = ss(A_double, B_double, C_double, 0);
zpk(G)
G_d= c2d(G,Ts,'zoh'); %Exact discrete-time model with sampling ADC  and zero order hold DAC
zpk(G_d)        
Plant=tf(G);
Plant_d = tf(G_d)
[A_d,B_d,C_d,D_d] = ssdata(G_d);
Bw = F_rotorred*[B_d(3:4);B_d(1:2)];

%% State Observer Feedback Control with integral action design
% compute the observer gain by pole placement
Zeta=1;
Wn = 35*2*pi;        
s_pole= [(-Zeta+sqrt(Zeta^2-1))*Wn,  (-Zeta-sqrt(Zeta^2-1))*Wn];
Pole_Pred=exp(s_pole*Ts);
Zeta2=1*Zeta;
Wn2 = 1*Wn; 
s_pole2= [(-Zeta2+sqrt(Zeta2^2-1))*Wn2,  (-Zeta2-sqrt(Zeta2^2-1))*Wn2];
Pole_Pred2=exp(s_pole2*Ts);
Pole_Pred = [Pole_Pred Pole_Pred2];       
L_Pred = acker(A_d',C_d',Pole_Pred);
L_Pred = L_Pred';

% compute the controller gain
Baug=[B_d;0];
Aaug=[A_d zeros(size(B_d)); C_d 1];
M_tune = [400 5 0 0 0.1];
Q_tune= M_tune'*M_tune;
R_tune = 800;
K_aug = dlqr(Aaug,Baug,Q_tune,R_tune,0)
K_SF=K_aug(1:size(A_d,1));
K_int = K_aug(size(A_d,1)+1:size(K_aug,2));   
pole(ss(Aaug,Baug,K_aug,0,Ts))
TF_yrf=ss(A_d-B_d*K_SF,B_d,C_d,[0],Ts);
pole(TF_yrf)

% make dcgain equal to 1
N=1/freqresp(TF_yrf,[0]);

% sim('DOBC_whole_v2.slx')
           
%% Feedforward and Repetitive Control
% compute the close loop transfer function
AA= [A_d-B_d*K_SF, -B_d*K_int,  B_d*K_SF; C_d, 1, zeros(size(C_d)); zeros(size(A_d)), zeros(size(B_d)), A_d-L_Pred*C_d];
BB= [B_d*N, B_d, Bw;-1., 0, 0; zeros(size(B_d)), B_d, Bw];
CC= [C_d, 0, zeros(size(C_d)); -K_SF, -K_int, K_SF; -C_d, 0, zeros(size(C_d))];
DD= [0 0 0; N 0 0; 1 0 0];
SS_closed = ss(AA,BB,CC,DD);
[NUM,DEN] = tfdata(SS_closed,'v');
TF=tf(NUM,DEN,Ts);
TF_yr = TF(1,1);
TF_yrN = TF_yr;


% Set reference signal to be 1hz
d_hz = 1;
Np = 1/Ts/d_hz;
% #non-casuality  
N1 = 3;

% filter design by hand, 5 order
F_design =(1-1.682*z^(-1)+0.9252*z^(-2))*(1-1.866*z^(-1)+0.8722*z^(-2))*(1+0.9991*z)*(1+9.739*z)/((1+0.1025*z^(-1)));

new_N = 1/dcgain(F_design);
F_filter = F_design*z^(-N1)*new_N;
F_filter2 = F_design*z^(-N1)*new_N;
F_filter2_num = F_filter2.Numerator{1,1};
F_filter2_denom = F_filter2.Denominator{1,1};
F_filter_num = F_filter.Numerator{1,1};
F_filter_denom = F_filter.Denominator{1,1};
M = TF_yrN*F_filter2;

% Compute Q
powerN2 = 5;
Q_design = ((z+2+z^(-1))/4)^powerN2;
N2 = 4*powerN2;
Q_filter = Q_design*z^(-powerN2);
Q_filter_num = Q_filter.Numerator{1,1};
Q_filter_denom = Q_filter.Denominator{1,1};

%% Sensitivity and Loop gain Plot
%Only containing repetitive control
M_red = M;
T_rep = M_red*z^(-Np)/(1-z^(-Np) + M_red*z^(-Np));
S_rep = (1-z^(-Np))/(1-z^(-Np)+M*z^(-Np));

% Comp and Rep sens with Q, double block Q_design
Q_s = Q_design^2;
S_CQ = Q_s*M_red*z^(-Np)/(1-Q_s*z^(-Np) + Q_s*M_red*z^(-Np));
S_RQ = (1-Q_s*z^(-Np))/(1-Q_s*z^(-Np)+Q_s*M*z^(-Np));

Loop_gain = M_red/(Q_s*z^(-Np)-1);

% containing both feedforward and repetitive
T_repff = (Q_s*M_red*z^(-Np) + M_red)/(1-Q_s*z^(-Np) + Q_s*M_red*z^(-Np));
S_repff = 1-T_repff;

LG_repff = (Q_s*M_red*z^(-Np) + M_red);
%% simulation
feedforward_switch = 1;
repetitive_switch = 1;

% tri=1 sq=2 step=3 sine=4 
signal_switch = 1;
open('../simulation/DOBC_whole_v2.slx')
sim('../simulation/DOBC_whole_v2.slx')







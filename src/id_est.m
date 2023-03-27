load("../data/system_id/id_step_out.mat")
load("../data/system_id/id_step_u.mat")
load("../data/system_id/id_chirp_out.mat")
load("../data/system_id/id_chirp_u.mat")
Ts = 0.001;
data1 = double(id_out{1}.Values.Data(4230:5730));
u1 = double(id_u{1}.Values.Data(4230:5730));
datai1 = iddata(data1,u1,Ts);
sys1 = tfest(datai1,1,0);
sys1_num = sys1.Numerator;
sys1_denom = sys1.Denominator
tau1 = 1/sys1_denom(2)
kapa1 = sys1_num/sys1_denom(2)
%% verification from chirp
data2 = double(id_chirp_out{1}.Values.Data);
u2= double(squeeze(id_chirp_u{1}.Values.Data(1,1,:)));
datai2 = iddata(data2,u2,Ts);
sys2 = tfest(datai2,1,0);
figure
bode(sys1)
figure
bode(sys2)

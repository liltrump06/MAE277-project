
%% motor 1 
V_s_1 = 10.58;
tau_1 = 0.4563;
kapa_1 = 542.7570;
b_1 = 0;                          % Motor-rotor viscous damping
% R = 4.6;                        % (Ohms)Motor coil resistant
R_1 = 3.8;
L_1 = 0.23e-3;                    %(Henry) Motor coil inductance (xxx)
K_m_1 = V_s_1/kapa_1 ;                %(Nm/A) Motor torque constant
m_1=4.6e-2;                       %(kg) Mass of pendulum
g=9.812;                        %(m/s^2) Gravitational acceleration
l_c=2.54*1E-2;                  %(m)Distance from pivot joint to the center of pendulum rod
J_rodc_1=2.36*1E-5;               %(kgm^2) Moment of inertia of pendulum about center of rod
J_rotor_1 = tau_1/R_1*K_m_1^2;          %(kgm^2)Moment of inertia of inertia mode of system
J_motor_1 = J_rotor_1 - J_rodc_1;
J_pend_1 = J_rotor_1+m_1*l_c^2;
%% motor 2
m_2=4.4*1E-2;       %(kg) Mass of pendulum          
J_rodc_2=2.16*1E-5;  %(kgm^2) Moment of inertia of pendulum about center of rod
J_motor_2=1.67*1E-6; %(kgm^2)  Moment of inertia of motor rotor
J_rotor_2= 5.574*1e-5;    %(kgm^2)Moment of inertia of inertia mode of system
J_pend_2=J_rotor_2+m_2*l_c^2 ;   %(kgm^2) Moment of inertia of pendulum mode of system
b_2 = 0;              % Motor-rotor viscous damping
R_2 = 3.85;             % (Ohms)Motor coil resistant
L_2 = 0.23e-3;          %(Henry) Motor coil inductance
K_m_2=2.580E-2 ;       %(Nm/A) Motor torque constant
V_s_2=12-0.65*2 ;    %(V)Supply voltage of the motor drive (H-bridge)

%% Parameters in the virtual plant simulation:
Tcomp=0.0005*Ts*14;  %controller computation delay (less than one sampling interval)
saturation =1.0;    %PWM duty cycle is between - and 100% and polarity
deadzone = 0.06;    % PWM switcing short circuit protection results in 4% duty cycle deadzone
Tss= 1/20000;       % 20kHz Encoder sampling rate by FPGA
encoder_resolution= 2*pi/2000;  % Encoder resolution 400 counts/revolutin
%%
Angle_Pendu=0/180*pi;   %pendulum equlibrium position, 0 is vertically down, 180 is up
K_g_1 = m_1*g*l_c;
K_g_2 =  m_2*g*l_c;
K_sin_2 = cos(Angle_Pendu);  %linearization sin(angle)
Friction_static = 4E-4; %Static friction Nm
K_pend_2 = 1;

Stepsize = 1;  %Stepsize= Angle_Pendu;
K_sin_1 = cos(Angle_Pendu);
K_pend_1 = 1;
K_tot_1 = K_g_1*K_sin_1*K_pend_1;
K_tot_2 = K_g_2*K_sin_2*K_pend_2;
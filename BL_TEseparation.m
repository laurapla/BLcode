function [Cnf, Cmf, Ccf, fprimeprime, fprime] = BL_TEseparation(s_span,Cnprime,C_Nalpha,Cm0,alpha,alpha0,alpha_E,alpha1,S1,S2,T_f,K0,K1,K2,eta)

% Function that computes the variations in the normal force, pitching
% moment and drag force coefficients due to trailing edge separation
% Cnf = normal force coefficient due to trailing edge separation
% Cmf = pitching moment due to trailing edge separation
% Cdf = drag force due to trailing edge separation
% fprimeprime = unsteady trailing edge separation point
% s_span = non-dimensional time vector
% Cnprime = equivalent critical normal force coefficient (vector)
% C_Nalpha = normal force coefficient curve slope
% Cm0 = zero lift pitching moment coefficient
% alpha = angle of attack (vector) [rad]
% alpha_E = effective angle of attack (vector) [rad]
% alpha1 = angle of attack at which the separation point is f=0.7
% S1 = coefficient that defines the stall characteristic
% S2 = coefficient that defines the stall characteristic
% T_f = time constant for separation point movement [s]
% K0 = aerodynamic center offset from the 1/4-chord
% K1 = effect on the center of pressure due to the growth of separated flow
% K2 = describes the shape of the moment break at stall
% eta = viscous effects factor

% Effective angle of attack (for separation)
alpha_f = Cnprime./C_Nalpha;

% Effective separation point
fprime = separation_point(alpha_f,alpha1,S1,S2);

% Initial conditions
xi = 1;

% Non-dimensionl time vector (to solve the dynamics)
s_time = s_span;

% System of equations
opts = odeset('RelTol',1e-2,'AbsTol',1e-4);
[~,x] = ode45(@(t,x) dx_TEseparation(t,x,fprime,T_f,s_time),s_span,xi,opts);

% Output
fprimeprime = x.';

% Normal force coefficient
Cnc = C_Nalpha*sin(alpha_E); % Circulatory normal force coefficient
Cnf = Cnc.*((1+sqrt(fprimeprime))/2).^2;

% Effective separation point for flow reattachment
fm = BL_mseparation(s_time,alpha,T_f,alpha1,S1,S2);
fbarret = max(fprimeprime,fm);

% Pitching moment coefficient
m = 2;
Cmf = (K0+K1*(1-fbarret)+K2*sin(pi*fbarret.^m)).*Cnc+Cm0;

% Drag force coefficient
Ccf = eta*Cnc.*sin(alpha_E).*sqrt(fprimeprime); % Chord force coefficient

end
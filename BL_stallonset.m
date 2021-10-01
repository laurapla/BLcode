function Cnprime = BL_stallonset(s_span,T_P,C_Nalpha,alpha_E)

% Function that computes the equivalent critical normal force coefficient
% for an unsteady motion
% Cnprime = equivalent critical normal force coefficient
% s_span = non-dimensional time vector
% T_P = time constant for leading edge pressure response
% C_N1 = critical normal force coefficient
% Cnp = normal force coefficient for attached flow

Cn_c = C_Nalpha*alpha_E;

% Initial condition
xi = 0;

% Non-dimensional time vector (to solve the dynamics)
s_time = s_span;

% System of equations
[~,x] = ode45(@(t,x) dx_stallonset(t,x,T_P,Cn_c,s_time),s_span,xi);

% Output
Cnprime = x.';

end
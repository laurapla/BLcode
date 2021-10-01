function [Cnv, Cmv, Cdv] = BL_dynamicstall(s_span,fprimeprime,alpha_E,Cnprime,C_Nalpha,T_v,T_vl,C_N1)

% Function that computes the contribution of the vortex that is 

% Non-dimensional time vector (to solve the dynamics)
s_time = s_span;

% Time rate of change of circulation
Cnc = C_Nalpha*alpha_E; % Circulatory normal force coefficient
[Cv, tauv] = vortex(Cnc,Cnprime,s_time,fprimeprime,T_vl,C_N1);
dCv = gradient(Cv,s_span);

% Initial condition
xi = 0;

% System of equations
[~,x] = ode45(@(t,x) dx_dynamicstall(t,x,T_v,dCv,s_time),s_span,xi);

% Output
Cnv = x.'; % Normal force coefficient due to the vortex

% Center of pressure
CPv = 0.25*(1-cos(pi*tauv/T_vl));

% Pitching moment coefficient
Cmv = -CPv.*Cnv;

% Drag force coefficient
Cdv = ones(1,length(s_time));

end
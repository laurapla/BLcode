function [C_Nalpha, alpha0, Cd0, alpha1, S1, S2, K0, K1, K2, C_M0, eta, C_N1, T_P, T_f, T_v, T_vl] = input_airfoil(airfoil)

if strcmp(airfoil,'NACA0012')
    C_Nalpha = rad2deg(0.113); % Normal force curve slope [1/rad]
    alpha0 = deg2rad(0.17); % [rad]
    Cd0 = 0; % Drag coefficient at alpha = 0
    alpha1 = deg2rad(14.0); % Angle at which f=0.7 [rad]
    S1 = 2.75; % Coefficient that defines the stall characteristics
    S2 = 1.4; % Coefficient that defines the stall characteristics
    K0 = 0.0175; % Aerodynamic center offset from the 1/4-chord
    K1 = -0.120; % Direct effect on the center of pressure due to the growth of the separated flow region
    K2 = 0.040; % Describes the shape of the moment break at stall
    C_M0 = -0.0037; % Zero-lift moment coefficient
    eta = 0.97; % Viscous effects factor
    C_N1 = 1.31; % Critical normal force coefficient
    T_P = 1.7; % Time constant for leading edge pressure response [s]
    T_f = 3.0; % Time constant for separation point [s]
    T_v = 6.0; % Time constant for vortex lift [s]
    T_vl = 7.0; % Time constant for vortex traverse over chord [s]
elseif strcmp(airfoil,'HH02')
    C_Nalpha = rad2deg(0.113); % Normal force curve slope [1/rad]
    alpha0 = deg2rad(-0.65); % [rad]
    Cd0 = 0; % Drag coefficient at alpha = 0
    alpha1 = deg2rad(14.75); % Angle at which f=0.7 [rad]
    S1 = 1.75; % Coefficient that defines the stall characteristics
    S2 = 2.25; % Coefficient that defines the stall characteristics
    K0 = -0.0059; % Aerodynamic center offset from the 1/4-chord
    K1 = -0.110; % Direct effect on the center of pressure due to the growth of the separated flow region
    K2 = 0.024; % Describes the shape of the moment break at stall
    C_M0 = -0.0006; % Zero-lift moment coefficient
    eta = 0.97; % Viscous effects factor
    C_N1 = 1.41; % Critical normal force coefficient
    T_P = 1.7; % Time constant for leading edge pressure response [s]
    T_f = 3.0; % Time constant for separation point [s]
    T_v = 6.0; % Time constant for vortex lift [s]
    T_vl = 7.75; % Time constant for vortex traverse over chord [s]
elseif strcmp(airfoil,'SC1095')
    C_Nalpha = rad2deg(0.116); % Normal force curve slope [1/rad]
    alpha0 = deg2rad(-0.73); % [rad]
    Cd0 = 0; % Drag coefficient at alpha = 0
    alpha1 = deg2rad(15.5); % Angle at which f=0.7 [rad]
    S1 = 1.10; % Coefficient that defines the stall characteristics
    S2 = 1.10; % Coefficient that defines the stall characteristics
    K0 = 0.003; % Aerodynamic center offset from the 1/4-chord
    K1 = -0.130; % Direct effect on the center of pressure due to the growth of the separated flow region
    K2 = 0.041; % Describes the shape of the moment break at stall
    C_M0 = -0.0236; % Zero-lift moment coefficient
    eta = 0.97; % Viscous effects factor
    C_N1 = 1.55; % Critical normal force coefficient
    T_P = 1.7; % Time constant for leading edge pressure response [s]
    T_f = 3.0; % Time constant for separation point [s]
    T_v = 6.0; % Time constant for vortex lift [s]
    T_vl = 6.75; % Time constant for vortex traverse over chord [s]
elseif strcmp(airfoil,'S814')
    C_Nalpha = 6.2670; % Normal force curve slope [1/rad]
    alpha0 = deg2rad(0.2339); % [rad]
    Cd0 = 0.0100; % Drag coefficient at alpha = 0
    alpha1 = deg2rad(10.4); % Angle at which f=0.7 [rad]
    S1 = 1.10; % Coefficient that defines the stall characteristics
    S2 = 3.7; % Coefficient that defines the stall characteristics
    K0 = -0.0180; % Aerodynamic center offset from the 1/4-chord
    K1 = -0.130; % Direct effect on the center of pressure due to the growth of the separated flow region
    K2 = 0.041; % Describes the shape of the moment break at stall
    C_M0 = -0.1330; % Zero-lift moment coefficient
    eta = 1; % Viscous effects factor
    C_N1 = 1.55; % Critical normal force coefficient
    T_P = 6.3300; % Time constant for leading edge pressure response [s]
    T_f = 4.0; % Time constant for separation point [s]
    T_v = 4.0; % Time constant for vortex lift [s]
    T_vl = 6.00; % Time constant for vortex traverse over chord [s]
end

end
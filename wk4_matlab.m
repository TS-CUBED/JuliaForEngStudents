tspan = [0, 10];

Rc = 0.03;
Rp = 1.0;
C = 2.0;
Lp = 1e-2;

P0 = [0, 0];

options        = odeset('Reltol',1e-9);

% Run once to allow Matlab to optimise
fprintf("First run:\n")
tic
[t, P] = ode45(@(t,P) wk4(t,P,Rc,Rp,C,Lp), tspan, P0, options);
toc

% Timed run
fprintf("\nSecond run:\n")
tic
[t, P] = ode45(@(t,P) wk4(t,P,Rc,Rp,C,Lp), tspan, P0, options);
toc



function dP = wk4(t,P,Rc,Rp,C,Lp)

dP    = zeros(2,1);

dP(1) = -Rc / Lp * P(1) ...
    + (Rc / Lp - 1 / Rp / C) * P(2) ...
    + Rc * didt(t) + i(t) / C;

dP(2) = -1 / Rp / C * P(2) + i(t) / C;

end

function i = i(t)

max_i = 425;
min_i = 0.0;

T = 0.9;

systTime = 2 / 5 * T;

dicrTime = 0.03;

i = ((max_i - min_i) * sin(pi / systTime * (mod(t,T))) ...
    *(mod(t,T) < (systTime + dicrTime)) ...
    + min_i);

end

function didt = didt(t)
dt = 1e-3;
didt = (i(t+dt) - i(t-dt)) / (2 * dt);
end

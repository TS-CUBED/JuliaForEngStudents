options        = odeset('Reltol',1e-9);



tspan = [0, 10];

Rc = 0.03;
Rp = 1.0;
C = 2.0;
Lp = 1e-2;

P0 = [0, 0];


tic
[t, P] = ode45(@(t,P) wk4(t,P,Rc,Rp,C,Lp), tspan, P0, options);
toc



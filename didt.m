function didt = didt(t)
dt = 1e-3;
didt = (i(t+dt) - i(t-dt)) / (2 * dt);
end


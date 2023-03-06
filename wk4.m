function dP = wk4(t,P,Rc,Rp,C,Lp)

dP    = zeros(2,1);

dP(1) = -Rc / Lp * P(1) ...
        + (Rc / Lp - 1 / Rp / C) * P(2) ...
        + Rc * didt(t) + i(t) / C;

dP(2) = -1 / Rp / C * P(2) + i(t) / C;

end

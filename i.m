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
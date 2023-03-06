#!/usr/bin/env python
# coding: utf-8

# In[1]:


import scipy as sp
from scipy import integrate
from scipy.misc import derivative

import numpy as np

import time


# In[2]:


def wk4(t, y, I, Rc, Rp, C, Lp, dt):

    dp1dt = (
        -Rc / Lp * y[0]
        + (Rc / Lp - 1 / Rp / C) * y[1]
        + Rc * derivative(I, t, dx=dt)
        + I(t) / C
    )

    dp2dt = -1 / Rp / C * y[1] + I(t) / C

    return [dp1dt, dp2dt]


# In[3]:


time_start = 0
time_end = 10

Rc = 0.2
Rp = 1.0
C = 1.0
Lp = 1e-2

dt = 1e-6

y0 = np.zeros(2)


# In[4]:


# Generic Input Waveform
# max volume flow in ml/s
max_i = 425

# min volume flow in m^3/s
min_i = 0.0

# Period time in s
T = 0.9

# Syst. Time in s
systTime = 2 / 5 * T

# Dicrotic notch time
dicrTime = 0.03

def I(t):
    # implicit conditional using boolean multiplicator
    # sine waveform
    I = (
        (max_i - min_i) * np.sin(np.pi / systTime * (t % T))
        *(t % T < (systTime + dicrTime)) + min_i
    )

    return I


# In[5]:

tic = time.perf_counter()
sol = sp.integrate.solve_ivp(lambda t, y: wk4(t, y, I, Rc, Rp, C, Lp, dt), (time_start, time_end), y0, method="RK45", rtol=1e-9, vectorized=True,)
toc = time.perf_counter()
print(f"Time elapsed: {toc - tic:0.4f} seconds")

# In[ ]:








# In[ ]:





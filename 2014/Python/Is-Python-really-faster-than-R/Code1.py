import numpy as np
import scipy.stats as ss

def case(n = 10, mu = 3, sigma = np.sqrt(5), p = 0.025, rep = 100):
    m = np.zeros((rep, 4))
    
    for i in range(rep):
        norm = np.random.normal(loc = mu, scale = sigma, size = n)
        xbar = np.mean(norm)
        low = xbar - ss.norm.ppf(q = 1 - p) * (sigma / np.sqrt(n))
        up = xbar + ss.norm.ppf(q = 1 - p) * (sigma / np.sqrt(n))
        
        if (mu > low) & (mu < up):
            rem = 1
        else:
            rem = 0
        
        m[i, :] = [xbar, low, up, rem]
        
    inside = np.sum(m[:, 3])
    per = inside / rep
    desc = "There are " + str(inside) + " confidence intervals that contain " \
           "the true mean (" + str(mu) + "), that is " + str(per) + " percent of the total CIs"
        
    return {"Matrix": m, "Decision": desc}

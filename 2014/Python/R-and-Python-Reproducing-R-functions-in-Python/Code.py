import numpy as np
import sys

def stcenter(x):
    
    if len(x.shape) is 1:
        sys.exit("ERROR: data must be a two dimensional array")
    elif x.shape[0] is 0:
        sys.exit("ERROR: data must have one or more observations for each location")
    elif x.shape[1] is 1:
        sys.exit("ERROR: data must have at least two locations")
    
    matrix = np.zeros(shape = x.shape)
    
    for j in range(x.shape[1]):
        matrix[:, j] = x[:, j] - np.mean(x[:, j])
        
    return matrix

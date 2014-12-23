# Import the modules required
import pandas as pd
import urllib

# Read the raw data from github
data_url = urllib.urlopen("https://raw.githubusercontent.com/alstat/Analysis-with-Programming/master/2014/Python/Numerical-Descriptions-of-the-Data/data.csv")
df = pd.read_csv(data_url)

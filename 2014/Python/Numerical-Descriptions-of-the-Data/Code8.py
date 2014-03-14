matplotlib.rcParams.update({'font.size': 11, 'font.family': 'serif'})
plt.locator_params(nbins = 8)

hist(df.ix[:,2], color = 'orange', normed = False)
plt.xticks(rotation = 45)
plt.xlabel('Data')
plt.ylabel('Count')
plt.title('Histogram of Benguet', fontsize = 18, verticalalignment = 'bottom', color = 'brown')
plt.grid(True, axis = 'y', which = 'major')

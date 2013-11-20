from matplotlib_venn import *
from matplotlib import pyplot as plt
v = venn2(subsets = {'10': 1, '01': 1, '11': 1}, set_labels = ('A', 'B'))
v.get_patch_by_id('10').set_alpha(0.5)
v.get_patch_by_id('10').set_color('orange')
v.get_patch_by_id('01').set_alpha(0.5)
v.get_patch_by_id('01').set_color('orange')
v.get_patch_by_id('11').set_alpha(0.75)
v.get_patch_by_id('11').set_color('orange')
v.get_label_by_id('10').set_text('')
v.get_label_by_id('01').set_text('')
v.get_label_by_id('11').set_text('')
v.get_label_by_id('A').set_text('')
v.get_label_by_id('B').set_text('')
v.get_label_by_id('A').set_size(20)
v.get_label_by_id('B').set_size(20)
plt.annotate('Event A', xy = v.get_label_by_id('10').get_position(), xytext = (-30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad=0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3, rad = 0.5', color = 'gray'))

plt.annotate('Event B', xy = v.get_label_by_id('01').get_position(), xytext = (30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3,rad = -0.5',color = 'gray'))

plt.show()

############################################################

from matplotlib_venn import *
from matplotlib import pyplot as plt
v = venn2(subsets = {'10': 1, '01': 1, '11': 1}, set_labels = ('A', 'B'))
v.get_patch_by_id('10').set_alpha(0.5)
v.get_patch_by_id('10').set_color('orange')
v.get_patch_by_id('01').set_alpha(0.5)
v.get_patch_by_id('01').set_color('orange')
v.get_patch_by_id('11').set_alpha(0.5)
v.get_patch_by_id('11').set_color('red')
v.get_label_by_id('10').set_text('')
v.get_label_by_id('01').set_text('')
v.get_label_by_id('11').set_text('')
v.get_label_by_id('A').set_text('')
v.get_label_by_id('B').set_text('')
v.get_label_by_id('A').set_size(20)
v.get_label_by_id('B').set_size(20)
plt.annotate('Event A', xy = v.get_label_by_id('10').get_position(), xytext = (-30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3, rad = 0.5', color = 'gray'))

plt.annotate('Event B', xy = v.get_label_by_id('01').get_position(), xytext = (30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3, rad = -0.5',color = 'gray'))

plt.annotate('Intersection', xy = v.get_label_by_id('11').get_position(), xytext = (0,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3,rad = 0',color = 'gray'))

plt.show()

############################################################

from matplotlib_venn import *
from matplotlib import pyplot as plt
import numpy as np
v = venn2(subsets = {'10': 1, '01': 1, '11': 1}, set_labels = ('A', 'B'))
v.get_patch_by_id('10').set_alpha(0.5)
v.get_patch_by_id('10').set_color('orange')
v.get_patch_by_id('01').set_alpha(0.5)
v.get_patch_by_id('01').set_color('red')
v.get_patch_by_id('11').set_alpha(0.5)
v.get_patch_by_id('11').set_color('orange')
v.get_label_by_id('10').set_text('')
v.get_label_by_id('01').set_text('')
v.get_label_by_id('11').set_text('')
v.get_label_by_id('A').set_text('')
v.get_label_by_id('B').set_text('')
v.get_label_by_id('A').set_size(20)
v.get_label_by_id('B').set_size(20)
plt.annotate('Event A', xy = v.get_label_by_id('10').get_position() + np.array([0.25,0]), xytext = (-30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round, pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3, rad=0.5',color = 'gray'))

plt.annotate('Intersection', xy = v.get_label_by_id('01').get_position(), xytext = (30,-70), size = 'xx-large',
             ha = 'center', textcoords = 'offset points', bbox = dict(boxstyle = 'round,pad = 0.5', fc = 'lime', alpha = 0.3),
             arrowprops = dict(arrowstyle = '->', connectionstyle = 'arc3, rad = -0.5', color = 'gray'))

plt.show()

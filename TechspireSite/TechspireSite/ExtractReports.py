import os
import glob
from os import walk

big_list = [["1", "2"], ["3", "4"]]
new_list = big_list.copy()
for row in new_list:
    row.insert(0, "Doom")

print(big_list)
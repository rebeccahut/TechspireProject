import os
import glob
from os import walk

start_dir = "Scripts"
for dir in glob.glob("Scripts/*/Report*"):
    print(dir)
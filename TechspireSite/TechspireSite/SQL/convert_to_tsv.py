import glob
import os
import csv

#Makes a copy of every csv file in a folder and converts them to have a .tsv extension
def convert_to_tsv():
    output_paths = glob.glob("Data/*.csv")
    for path in output_paths:
        f = open(path, 'r')
        path = path[:-4] + ".tsv"
        out = open(path, 'w')
        reader = csv.reader(f, delimiter="\t")
        writer = csv.writer(out, delimiter="\t")
        for row in reader:
            writer.writerow(row)
        f.close()
        out.close()


if __name__ == '__main__':
    convert_to_tsv()


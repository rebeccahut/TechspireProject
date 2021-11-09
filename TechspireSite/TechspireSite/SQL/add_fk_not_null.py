import glob
import os


def convert_to_csv():
    output_paths = glob.glob("*/Alter*")
    for path in output_paths:
        f = open(path, 'r')
        filedata = f.read()
        f.close()
        newdata = filedata.replace("FOREIGN KEY", "NOT NULL FOREIGN KEY")
        f = open(path, 'w')
        f.write(newdata)
        f.close()


if __name__ == '__main__':
    convert_to_csv()


import glob
import os


def combine_related_files(file_text, file_ext):
    output_paths = glob.glob("*/" + file_text + "*." + file_ext)
    out_file = open(file_text + "." + file_ext, "w")
    for path in output_paths:
        out_file.write("--" + os.path.dirname(path) + "\n")
        in_file = open(path)
        out_file.writelines(in_file.readlines())
        out_file.write("\n")
        out_file.write("\n")


if __name__ == '__main__':
    combine_related_files("Create", "sql")

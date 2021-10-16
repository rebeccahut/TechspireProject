import glob
import os


def combine_related_files(file_text, file_ext):
    output_paths = glob.glob("*/" + file_text + "*." + file_ext)
    out_file = open(file_text + "." + file_ext, "w", encoding="utf8")
    for path in output_paths:
        in_file = open(path, encoding="utf8")
        path = path.replace("\u200c", "")
        out_file.write("--" + os.path.dirname(path) + "\n")
        in_lines = in_file.readlines()
        for line in in_lines:
            line.replace("\u200c", "")
        out_file.writelines(in_lines)
        out_file.write("\n")
        out_file.write("\n")


if __name__ == '__main__':
    combine_related_files("Create", "sql")

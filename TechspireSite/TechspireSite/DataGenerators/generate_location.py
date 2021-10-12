import csv
import pandas
import numpy as np

if __name__ == '__main__':
    raw_states = pandas.read_csv("StateList.csv", sep="\t", header=None)
    selected_states = raw_states.sample(200, replace=False)
    selected_states = selected_states[[0]].copy()
    selected_states.reset_index(inplace=True, drop=True)
    selected_states.index += 1
    selected_states.columns = ["country_id"]
    selected_states["1"] = ""
    selected_states["2"] = ""
    selected_states["3"] = ""
    selected_states = selected_states[["1", "2", "3", "country_id"]].copy()
    selected_states.to_csv("LocationList.csv", sep='\t', index=True, header=False)
import csv
import pandas


if __name__ == '__main__':
    raw_countries = pandas.read_csv("RawStates.csv")
    new = raw_countries[["id", "name", "country_id"]].copy()
    new.sort_values(by=['id'], inplace=True)
    new.to_csv("StateList.csv", sep='\t', index=False, header=False)


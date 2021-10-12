import csv
import pandas


if __name__ == '__main__':
    raw_countries = pandas.read_csv("RawCountries.csv")
    new = raw_countries[["id", "name"]].copy()
    new.to_csv("CountryList.csv", sep='\t', index=False, header=False)


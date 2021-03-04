import os
import csv

path = os.path.dirname(os.path.abspath(__file__))
path = os.path.dirname(os.getcwd())
path = path + "/data/raw"
full_path_in = os.path.join(path, 'who_suicide_statistics.csv')

path = os.path.dirname(os.getcwd())
path = path + "/data/processed"
output_file = open(path + "/who_suicide_statistics.csv", 'w')

#reading the dataset and converting it to a list
with open("who_suicide_statistics.csv") as input_file:
    reader = csv.reader(input_file)
    data = list(reader)

#removing the first row
data.remove(data[0])

#writing data to the output file
for row in data:
    rowstring = ",".join(row)
    output_file.write(rowstring + "\n")
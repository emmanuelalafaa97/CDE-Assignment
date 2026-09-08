#!/usr/bin/bash

# This script extracts the contents of a URL to a specified directory.

URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
curl -o raw/survey_data.csv "$URL"

raw_data=$(realpath raw/survey_data.csv)
echo "The file has been downloaded to: $raw_data"

#Selecting the following columns: year, Value, Units, variable_code we want to keep from the raw data and save it to a new file
cut_data=$(echo "$raw_data" | cut -d, -f 1,5-6,9) 

mkdir -p Transformed
#Saving the content of these selected columns into a file named 2023_year_finance.csv in an already created directory called Transformed
transformed_data=$(echo "$cut_data" > Transformed/2023_year_finance.csv)

echo $transformed_data

#use realpath to get the absolute path of the file and print it to the console
realpath Transformed/2023_year_finance.csv

mkdir -p Gold

#copy the transformed file to the Gold directory
cp Transformed/2023_year_finance.csv Gold/

#use realpath to get the absolute path of the file and print it to the console
realpath Gold/2023_year_finance.csv





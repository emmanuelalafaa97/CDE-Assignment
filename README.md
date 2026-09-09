# CDE-Assignment


## Project Objectives

 The main objectives of this project are to:

 1. Build a Bash-based ETL pipeline.
 2. Extract a CSV dataset from an external URL.
 3. Store the raw dataset without modification.
 4. Transform the dataset by:
    i. Renaming Variable_code to variable_code
    ii. Selecting only the required columns:
     `year, Value, Units, variable_code
 5. Store the transformed dataset in a dedicated directory.
 6. Load the transformed dataset into a Gold directory.
 7. Schedule the ETL pipeline to run automatically every day at midnight.

## Project Structure
```
 CoreDataEngineers/
 ├── scripts/
 │   ├── extract_script.sh
 │   
 │
 ├── cron/
 │   └── etl_cronjob
 │
 ├── raw/
 ├── Transformed/
 ├── Gold/
 ├── json_and_CSV/
 └── README.md
```

1. ETL Pipeline

The main ETL pipeline is implemented entirely using Bash scripting.

The pipeline consists of three stages:

``` External CSV
     │
     ▼
  EXTRACT
     │
     ▼
    raw/
     │
     ▼
 TRANSFORM
     │
     ▼
 Transformed/
     │
     ▼
    LOAD
     │
     ▼
   Gold/
```

### Extract

The pipeline downloads the Annual Enterprise Survey 2023 financial-year provisional dataset from the Stats NZ website.

The dataset is downloaded into the raw directory.

The source URL is stored in an environment variable rather than being hard-coded directly into the script.

``` 
   URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"
   
```
 
 Then saved to a file called "survey_data.csv" in the raw folder

 ```
    curl -o raw/survey_data.csv "$URL"
```
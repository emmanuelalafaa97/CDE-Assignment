# CDE-Assignment


## Project Objectives

 The main objectives of this project are to:

 1. Build a Bash-based ETL pipeline.
 2. Extract a CSV dataset from an external URL.
 3. Store the raw dataset without modification.
 4. Transform the dataset by:
    i. Renaming Variable_code to variable_code
    ii. Selecting only the required columns:
        year, Value, Units, variable_code
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

### 1. ETL Pipeline

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

#### Extract

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




### 2. Cron Job Scheduling

The ETL pipeline is scheduled using the Linux cron scheduler.

The requirement is for the pipeline to execute automatically every day at:

12:00 AM

The cron expression used is:

```
   0 0 * * *
```

This represents:
```
  Field	Value	Meaning
  Minute	0	At minute zero
  Hour	0	At midnight
  Day	*	Every day
  Month	*	Every month
  Weekday	*	Every day of the week
```

Therefore:
```
  0 0 * * *
```
means:
```
 Run the ETL pipeline every day at 12:00 AM.
```

### 3. Git Version Control

All project files are version-controlled using Git.

Git is used to track changes to:

 * Bash scripts
 * README documentation
 * Configuration files
 * Project structure
 * Other relevant project files

Initialize the repository:
```
  git init
```
Check the repository status:
```
  git status
```
Add project files:
```
  git add .
```
Create the initial commit:
```
  git commit -m "Initial commit: add Bash ETL pipeline"
```
Additional changes can be tracked using:
``` 
  git add .
  git commit -m "Update ETL pipeline and documentation"
```
### Recommended Git Workflow

The project follows a simple Git workflow:
```
  Modify files
       │
       ▼
  git status
       │
       ▼
  git add .
       │
       ▼
  git commit
       │
       ▼
  Versioned project
```
Commit messages should clearly describe the change being introduced.

Examples:
``` 
  git commit -m "Add Bash ETL pipeline"
  git commit -m "Add cron scheduling configuration"
  git commit -m "Add CSV and JSON file management script"
  git commit -m "Update project documentation"

```
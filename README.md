# northwind-analytics-engineering-project-with-dbt-and-bigquery

![Architecture](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/project_architecture.jpg)

##  Project Summary
This is a Northwind Trader Analytics Engineering Project - Using dbt and BigQuery. Its an end-to-end project that leverage that help the northwind sales set up their analytic warehouse for reporting using dbt,bigquery and Google Looker Studio.


##  Prerequiste for this project is 
1. A dbt free account.
2. A GCP account.

## Data Sources: 
The dataset use is a sample Northwind database created by Microsoft that's contains all sales information about Northwind Traders(A food import-export company) [download here](https://github.com/dalers/mywind).

## Summary
This project involves:
1. Creating a data lake called northwind_ds in bigquery.
2. Creating a staging layer in dbt to get our data from source.
3. Creating a data warehouse layer where i created my fact and dim tables using Kimball dimensional modelling technique
4. Creating data for a one big table (OBT) for reporting.
5. Data Visualisation in Google looker Studio.

## Summary
This project involves:
1. Creating a dataset called northwind_ds on bigquery.Refer to GCP documentation on how to create a project and datasets here if its your first time.

2. Creating a staging layer in dbt to get our data from source.

Lets create our first staging table. we will create the stg_customer table in our model in dbt referencing the source from our big query datalake northwing_ds

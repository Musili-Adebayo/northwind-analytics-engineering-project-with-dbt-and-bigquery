# Northwind-Analytics-Engineering-Project-with-dbt-and-BigQuery

![Architecture](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/project_architecture.jpg)

##  Project Summary
This is a Northwind Trader Analytics Engineering Project - Using dbt and BigQuery. Its an end-to-end project that leverage that help the northwind sales set up their analytic warehouse for reporting using dbt, BigQuery and Google Looker Studio.


## Prerequisite for this project is 
1. A dbt free account.
2. A GCP account.
3. A GCP service account (Optional).

## Data Sources: 
The dataset used is a sample Northwind database created by Microsoft that contains all sales information about Northwind Traders (A food import-export company) [download here](https://github.com/dalers/mywind).

## Summary
This project involves:
1. Creating a Dataset called northwind_ds in BigQuery.
2. Creating models for transforming our data from its source-conformed state to business-conformed state.
    a. Creating a staging layer in dbt to get our data from the source.
    b. Creating a data warehouse layer where I created my fact and dim tables using Kimball dimensional modelling techniques.
    c. Creating the analytical layer for data for a one big table (OBT) for reporting.
3. Data Visualisation in Google Looker Studio.


Lets get started.

1. Creating a Dataset called northwind_ds in BigQuery. I created a Dataset called northwind_ds on BigQuery where I extracted all the raw northwind traders tables before modelling of dbt starts

![Northwind_dataset_creation_bigquery](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/northwind_dataset_creation_on_bigquery.png)

Please note that the ERD Diagram we will be implementing for this project will use the Kimball dimensional modelling.

![ERD](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/entity-relationship-diagram/ae-bootcamp-erd-physical.drawio.png)

Also, the dbt_project_yml file used in this project.
![dbt_project_yml](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/dbt_project_yaml_image.png)


2. Creating models for transforming our data from its source-conformed state to business-conformed state.

-- I started by creating a staging layer in dbt to get our data from the source. This includes all the tables from our raw data. We will create the stg_customer table in our model in dbt referencing the source from our big query datalake northwing_ds
![staging_Layer](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/staging_layer.png)

See our staging table on BigQuery

![staging_on_bigquery](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/staging_on_bigquery.png)

-- I also created a Warehouse layer where I created dimension and fact tables based on the Northwind business requirements.
![warehouse_layer](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/warehouse_layer.png)

Below is the created warehouse name dbt_musili_dwh_northwind on ,BigQuery showing that I have created the dim_customer data from the referencing data in the staging layer

![Datawarehouse on Bigquery](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/datawarehouse_on_bigquery.png)

Finally, I created 3 One Big Table (OBT) which provides data for anlytical reporting.
![Analytics OBT Layer](https://github.com/Musili-Adebayo/northwind-analytics-engineering-project-with-dbt-and-bigquery/blob/main/northwind_project/project_file/images/analytics_obt_layer.png)


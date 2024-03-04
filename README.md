# UoM_MapReduce-vs-Spark
UoM MSc - Big Data Analytics Technologies - MapReduce vs Spark Assignment

In this assignment, I will analyze the [Airline Delay](https://www.kaggle.com/code/adveros/flight-delay-eda-exploratory-data-analysis/notebook) dataset using MapReduce and Spark.

The airlines market has faced losses due to flight delays, and there are many reasons for delaying a flight. In this Analysis, I will be analysing the various delays happen in airlines per year for below scenarios.

```bash
i. Year wise carrier delay from 2003-2010
ii. Year wise NAS delay from 2003-2010
iii. Year wise Weather delay from 2003-2010
iv. Year wise late aircraft delay from 2003-2010
v. Year wise security delay from 2003-2010
```


## Prerequisites

Below steps are followed before starting the analysis.

1. Create a AWS S3 bucket -> delayflights-data
3. Create a folder named input in the bucket and upload the Airline Delay dataset (available in the "data/" directory)
4. Create a AWS EMR cluster with Hive and Spark installed -> emr_cluster_bigdata
 

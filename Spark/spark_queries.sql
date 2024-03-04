# Start Spark Session
spark-shell

# Load Data
var df=spark.read.format("csv").load("s3://delayflights_data/input/DelayedFlights-updated.csv")

# verufy loaded data
df.show()

# Creating a Temporary View delay_fights
df.createOrReplaceTempView("delay_flights")

# Queries

-- Year wise carrier delay from 2003-2010
val  result1 = spark.time(spark.sql("SELECT _c1 as Year, avg((_c25/_c15)*100) as year_wise_carrier_delay from delay_flights GROUP BY Year ORDER BY Year DESC").show())

-- Year wise NAS delay from 2003-2010
val  result2 = spark.time(spark.sql("SELECT _c1 as Year, avg((_c27/_c15)*100) as year_wise_NAS_delay from delay_flights GROUP BY Year ORDER BY Year DESC").show())

-- Year wise Weather delay from 2003-2010
val  result3 = spark.time(spark.sql("SELECT _c1 as Year, avg((_c26/_c15)*100) as year_wise_weather_delay from delay_flights GROUP BY Year ORDER BY Year DESC").show())

-- Year wise late aircraft delay from 2003-2010
val  result4 = spark.time(spark.sql("SELECT _c1 as Year, avg((_c29/_c15)*100) as year_wise_late_aircraft_delay from delay_flights GROUP BY Year ORDER BY Year DESC").show())

-- Year wise security delay from 2003-2010
val  result5 = spark.time(spark.sql("SELECT _c1 as Year, avg((_c28/_c15)*100) as year_wise_security_delay from delay_flights GROUP BY Year ORDER BY Year DESC").show())
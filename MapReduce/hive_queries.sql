## Start Hive Session ##
hive

## Create Empty Table ##
CREATE EXTERNAL TABLE delay_flights ( 
Id INT, 
Year INT,
Month INT, 
DayofMonth INT, 
DayOfWeek INT, 
DepTime INT, 
CRSDepTime INT, 
ArrTime INT,
CRSArrTime INT,
UniqueCarrier STRING, 
FlightNum INT,
TailNum STRING,
ActualElapsedTime INT,
CRSElapsedTime INT,
AirTime INT,
ArrDelay DOUBLE,
DepDelay DOUBLE,
Origin STRING,
Dest STRING,
Distance INT,
TaxiIn INT,
TaxiOut INT,
Cancelled INT,
CancellationCode STRING,
Diverted DOUBLE,
CarrierDelay INT,
WeatherDelay INT,
NASDelay INT,
SecurityDelay INT,
LateAircraftDelay INT
) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' LOCATION 's3://delayflights_data/hadoop/';

## Load Data ##
LOAD DATA INPATH 's3://delayflights_data/input/DelayedFlights-updated.csv' OVERWRITE INTO TABLE delay_flights;

## Queries ##

-- Year wise carrier delay from 2003-2010
SELECT Year, avg((carrierdelay/arrdelay) * 100) as Year_wise_carrier_delay from delay_flights WHERE year BETWEEN 2003 AND 2010 GROUP BY year ORDER BY year DESC;

-- Year wise NAS delay from 2003-2010
SELECT Year, avg((nasdelay/arrDelay) * 100) as Year_wise_nas_delay from delay_flights WHERE year BETWEEN 2003 AND 2010 GROUP BY year ORDER BY year DESC;

-- Year wise Weather delay from 2003-2010
SELECT Year, avg((WeatherDelay/arrDelay) * 100) as Year_wise_weather_delay from delay_flights WHERE year BETWEEN 2003 AND 2010 GROUP BY year ORDER BY year DESC;

-- Year wise late aircraft delay from 2003-2010
SELECT Year, avg((LateAircraftDelay/arrDelay) * 100) as Year_wise_LateAircraft_delay from delay_flights WHERE year BETWEEN 2003 AND 2010 GROUP BY year ORDER BY year DESC;

-- Year wise security delay from 2003-2010
SELECT Year, avg((SecurityDelay/arrDelay) * 100) as Year_wise_security_delay from delay_flights WHERE year BETWEEN 2003 AND 2010 GROUP BY year ORDER BY year DESC;
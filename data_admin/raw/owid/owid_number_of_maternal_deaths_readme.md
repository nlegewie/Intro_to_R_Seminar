# Number of maternal deaths - Data package

This data package contains the data that powers the chart ["Number of maternal deaths"](https://ourworldindata.org/explorers/global-health?Health+Area=Maternal+health&Indicator=Maternal+mortality&Metric=Number+of+deaths&Source=World+Bank&country=OWID_WRL~CHN~ZAF~BRA~USA~GBR~IND~RWA) on the Our World in Data website.

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The remaining columns are the data columns, each of which is a time series. If the CSV data is downloaded using the "full data" option, then each column corresponds to one time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data columns are transformed depending on the chart type and thus the association with the time series might not be as straightforward.

## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

### How we process data at Our World In Data
All data and visualizations on Our World in Data rely on data sourced from one or several original data providers. Preparing this original data involves several processing steps. Depending on the data, this can include standardizing country names and world region definitions, converting units, calculating derived indicators such as per capita measures, as well as adding or adapting metadata such as the name or the description given to an indicator.
[Read about our data pipeline](https://docs.owid.io/projects/etl/)

## Detailed information about each time series


## Number of maternal deaths
The annual number of female deaths from any cause related to or aggravated by pregnancy or its management (excluding accidental or incidental causes) during pregnancy and childbirth or within 42 days of termination of pregnancy, irrespective of the duration and site of the pregnancy.
Last updated: May 19, 2025  
Next update: May 2026  
Date range: 1985–2023  
Unit: Deaths  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
World Health Organization - Global Health Observatory (2025) – processed by Our World in Data

#### Full citation
World Health Organization - Global Health Observatory (2025) – processed by Our World in Data. “Number of maternal deaths” [dataset]. World Health Organization, “Global Health Observatory” [original data].
Source: World Health Organization - Global Health Observatory (2025) – processed by Our World In Data

### How is this data described by its producer - World Health Organization - Global Health Observatory (2025)?
#### Definition
The annual number of female deaths from any cause related to or aggravated by pregnancy or its management (excluding accidental or incidental causes) during pregnancy and childbirth or within 42 days of termination of pregnancy, irrespective of the duration and site of the pregnancy.

#### Method of measurement
Recorded or estimated number of maternal deaths. Measurement requires information on pregnancy status, timing of death (during pregnancy, childbirth, or within 42 days of termination of pregnancy), and cause of death.

#### Method of estimation
Data on maternal mortality and other relevant variables are obtained through databases maintained by WHO, UNPD, UNICEF, and the World Bank Group. Data available from countries varies in terms of the source and methods. Given the variability of the sources of data, different methods are used for each data source in order to arrive at country estimates that are comparable and permit regional and global aggregation. The current methodology employed by the Maternal Mortality Estimation Inter-Agency Group (MMEIG) in this round followed an improved approach that built directly upon methods used to produce the previous rounds of estimates published by the MMEIG since 2008. Estimates for this round were generated using a Bayesian approach, referred to as the Bayesian maternal mortality estimation model, or BMat model. This enhanced methodology uses the same core estimation method as in those previous rounds, but adds refinements to optimize the use of country-specific data sources and excludes late maternal deaths. It therefore provides more accurate estimates, and a more realistic assessment of certainty about those estimates. The new model still incorporates the same covariates which are; the Gross Domestic Product per capita based on purchasing power parity conversion (GDP), the general fertility rate (GFR), and proportion of births attended by a skilled health worker (SAB)). The MMEIG has developed a method to adjust existing data in order to take into account these data quality issues and ensure the comparability of different data sources. This method involves assessment of data for underreporting and, where necessary, adjustment for incompleteness and misclassification of deaths as well as development of estimates through statistical modelling for countries with no reliable national level data. Predominant type of statistics: predicted

### Source

#### World Health Organization – Global Health Observatory
Retrieved on: 2025-05-19  
Retrieved from: https://www.who.int/data/gho  


    
# Child mortality rate - Data package

This data package contains the data that powers the chart ["Child mortality rate"](https://ourworldindata.org/explorers/global-health?Health+Area=Child+health&Indicator=Child+mortality&Metric=Rate&Source=UN+IGME&country=OWID_WRL~CHN~ZAF~BRA~USA~GBR~IND~RWA) on the Our World in Data website. It was downloaded on January 23, 2026.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.

## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## Child mortality rate
The estimated number of deaths of children aged under five years, per 100 live births .
Last updated: March 25, 2025  
Date range: 1932–2023  
Unit: deaths per 100 live births  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
United Nations Inter-agency Group for Child Mortality Estimation (2025) – with minor processing by Our World in Data

#### Full citation
United Nations Inter-agency Group for Child Mortality Estimation (2025) – with minor processing by Our World in Data. “Child mortality rate” [dataset]. United Nations Inter-agency Group for Child Mortality Estimation, “United Nations Inter-agency Group for Child Mortality Estimation”; Various sources, “Population” [original data].
Source: United Nations Inter-agency Group for Child Mortality Estimation (2025) – with minor processing by Our World In Data

### Sources

#### United Nations Inter-agency Group for Child Mortality Estimation
Retrieved on: 2025-03-25  
Retrieved from: https://childmortality.org/all-cause-mortality/data  

#### Various sources – Population
Retrieved on: 2024-07-11  
Retrieved from: https://ourworldindata.org/population-sources  


    
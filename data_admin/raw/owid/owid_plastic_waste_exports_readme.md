# Plastic waste exports - Data package

This data package contains the data that powers the chart ["Plastic waste exports"](https://ourworldindata.org/explorers/plastic-pollution?Metric=Waste+trade&Sub-metric=Exports&Per+capita=false&Share+of+world+total=false&Source=OECD&country=USA~CHN~IND) on the Our World in Data website. It was downloaded on January 25, 2026.

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


## Exports of plastic waste via all modes of transport
The amount of plastic waste that a country exports, measured in tonnes.
Last updated: September 25, 2025  
Next update: September 2026  
Date range: 1988–2024  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
United Nations Comtrade Database (2023); United Nations Comtrade Database (2025) – with minor processing by Our World in Data

#### Full citation
United Nations Comtrade Database (2023); United Nations Comtrade Database (2025) – with minor processing by Our World in Data. “Exports of plastic waste via all modes of transport” [dataset]. United Nations Comtrade Database, “Comtrade Database” [original data].
Source: United Nations Comtrade Database (2025), United Nations Comtrade Database (2023) – with minor processing by Our World In Data

### What you should know about this data
* This covers plastic waste classified as HS 3915 in UN trade statistics.
* It includes all transport methods: air, sea, road, rail, inland waterways, and cases where the transport mode wasn't specified.
* Measured in tonnes (net weight).
* This includes re-exports (when a country imports plastic waste and then exports it again).
* Not all countries report transport mode details for every year.

### Source

#### United Nations Comtrade Database – Comtrade Database
Retrieved on: 2025-09-25  
Retrieved from: https://comtradeplus.un.org/  


    
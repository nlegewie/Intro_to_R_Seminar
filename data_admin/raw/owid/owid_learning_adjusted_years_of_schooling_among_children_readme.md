# Learning-adjusted years of schooling among children - Data package

This data package contains the data that powers the chart ["Learning-adjusted years of schooling among children"](https://ourworldindata.org/grapher/years-of-schooling?v=1&csvType=full&useColumnShortNames=false&level=all&metric_type=learning_adjusted_years_schooling&sex=both) on the Our World in Data website. It was downloaded on March 20, 2026.

### Active Filters

A filtered subset of the full data was downloaded. The following filters were applied:

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For most countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

The third column is either "Year" or "Day". If the data is annual, this is "Year" and contains only the year as an integer. If the column is "Day", the column contains a date string in the form "YYYY-MM-DD".

The final column is the data column, which is the time series that powers the chart. If the CSV data is downloaded using the "full data" option, then the column corresponds to the time series below. If the CSV data is downloaded using the "only selected data visible in the chart" option then the data column is transformed depending on the chart type and thus the association with the time series might not be as straightforward.


## Metadata.json structure

The .metadata.json file contains metadata about the data package. The "charts" key contains information to recreate the chart, like the title, subtitle etc.. The "columns" key contains information about each of the columns in the csv, like the unit, timespan covered, citation for the data etc..

## About the data

Our World in Data is almost never the original producer of the data - almost all of the data we use has been compiled by others. If you want to re-use data, it is your responsibility to ensure that you adhere to the sources' license and to credit them correctly. Please note that a single time series may have more than one source - e.g. when we stich together data from different time periods by different producers or when we calculate per capita metrics using population data from a second source.

## Detailed information about the data


## Learning-adjusted years of schooling
[Learning-adjusted years of schooling](#dod:lays) combine the quantity and quality of education into one metric, accounting for the fact that similar durations of schooling can yield different learning outcomes.
Last updated: September 8, 2025  
Next update: September 2026  
Date range: 2010–2020  
Unit: years  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
World Bank based on methodology in Filmer et al. (2018) – processed by Our World in Data

#### Full citation
World Bank based on methodology in Filmer et al. (2018) – processed by Our World in Data. “Learning-adjusted years of schooling” [dataset]. World Bank Gender Statistics, “World Bank Gender Statistics” [original data].
Source: World Bank based on methodology in Filmer et al. (2018) – processed by Our World In Data

### What you should know about this data
* This indicator combines the quantity and quality of education into a single measure.
* It shows how many years of schooling in a high-performing system are equivalent to the education a student receives in their country.
* The calculation multiplies expected years of schooling by a learning adjustment factor based on international test performance.
* Countries are compared against a benchmark for advanced learning; higher-performing countries get higher adjustments, and lower-performing ones get lower adjustments.
* It captures both access to schooling and learning effectiveness, showing whether students spend time in school productively.

### How is this data described by its producer - World Bank based on methodology in Filmer et al. (2018)?
**Definition:** Learning-adjusted years of school are calculated by multiplying the estimates of expected years of school by the ratio of most recent harmonized test scores to 625.

### Source

#### World Bank Gender Statistics
Retrieved on: 2025-09-08  
Retrieved from: https://genderdata.worldbank.org/en/home  


    
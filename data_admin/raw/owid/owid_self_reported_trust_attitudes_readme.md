# Share of people agreeing with the statement "most people can be trusted" - Data package

This data package contains the data that powers the chart ["Share of people agreeing with the statement "most people can be trusted""](https://ourworldindata.org/grapher/self-reported-trust-attitudes?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For most countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

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


## Trust in others
% of respondents replying "Most people can be trusted" when asked "Generally speaking, would you say that most people can be trusted or that you need to be very careful in dealing with people?" Possible answers include "Most people can be trusted", "Do not know" and "Need to be very careful".
Last updated: June 27, 2025  
Next update: June 2026  
Date range: 1984–2022  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Integrated Values Surveys (2024) – with major processing by Our World in Data

#### Full citation
Integrated Values Surveys (2024) – with major processing by Our World in Data. “Trust in others – Integrated Values Surveys” [dataset]. Integrated Values Surveys, “Integrated Values Surveys (IVS) Version 4” [original data].
Source: Integrated Values Surveys (2024) – with major processing by Our World In Data

### What you should know about this data
* When available, we consider “Don’t know” and “No answer” to be valid response categories and include them in percentage calculations. “Missing” responses, however, are excluded from the set of possible answers.
* The years in the data represent the latest year of each Integrated Values Surveys wave, which is not necessarily the year of the survey. For example, the 2022 wave (IVS wave 7) includes surveys conducted between 2017 and 2022. This is done to improve comparability across waves.

### Source

#### Integrated Values Surveys – Integrated Values Surveys (IVS)
Retrieved on: 2025-06-27  
Retrieved from: https://www.worldvaluessurvey.org/WVSEVStrend.jsp  

#### Notes on our processing step for this indicator
We collected the data by merging the World Values Survey and the European Values Study, following the methodology described in the [Integrated Values Surveys (IVS) website](https://www.worldvaluessurvey.org/WVSEVStrend.jsp).

We processed the indicators from microdata of the IVS using Stata. Weights are applied for each country.

We consider “Don’t know” and “No answer” to be valid response categories and include them in percentage calculations. “Missing” responses, however, are excluded from the set of possible answers.

We processed the years in the data to represent the latest year of each IVS wave, which is not necessarily the year of the survey. For example, the 2022 wave (IVS wave 7) includes surveys conducted between 2017 and 2022.



    
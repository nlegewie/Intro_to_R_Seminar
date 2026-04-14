# Female homicide rate - Data package

This data package contains the data that powers the chart ["Female homicide rate"](https://ourworldindata.org/grapher/female-homicide-rate?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Homicide rate per 100,000 population of female victims
[Intentional homicide](#dod:homicide) rate per 100,000 populationof female victims
.
Last updated: May 28, 2025  
Next update: May 2026  
Date range: 1990–2024  
Unit: homicides per 100,000 population  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UN, World Population Prospects (2024); United Nations Office on Drugs and Crime (2025) – with minor processing by Our World in Data

#### Full citation
UN, World Population Prospects (2024); United Nations Office on Drugs and Crime (2025) – with minor processing by Our World in Data. “Homicide rate per 100,000 population of female victims” [dataset]. United Nations Office on Drugs and Crime, “United Nations Office on Drugs and Crime - Intentional Homicide Victims”; United Nations, “World Population Prospects”; United Nations, “World Population Prospects - Interim Update”; Various sources, “Population” [original data].
Source: UN, World Population Prospects (2024); United Nations Office on Drugs and Crime (2025) – with minor processing by Our World In Data

### What you should know about this data
* UNODC collects intentional homicide data from criminal justice systems (law enforcement records) and public health systems (death certificates).
* Intentional homicide requires three elements: one person killing another, intent to kill or seriously injure, and the act was illegal. For example, a person who kills another in self-defence is not considered to have committed an intentional homicide as justifiable homicide in self-defence is not illegal.
* All killings that meet the criteria listed below are to be considered intentional homicides, irrespective of definitions provided by national legislations or practices.
* Terrorist killings are included as intentional homicides.

### Sources

#### United Nations Office on Drugs and Crime – United Nations Office on Drugs and Crime - Intentional Homicide Victims
Retrieved on: 2025-05-28  
Retrieved from: https://dataunodc.un.org/dp-intentional-homicide-victims  

#### United Nations – World Population Prospects
Retrieved on: 2024-07-11  
Retrieved from: https://population.un.org/wpp/downloads/  

#### United Nations – World Population Prospects - Interim Update
Retrieved on: 2026-03-31  
Retrieved from: https://population.un.org/wpp/downloads/  

#### Various sources – Population
Retrieved on: 2026-03-31  
Retrieved from: https://ourworldindata.org/population-sources  

#### Notes on our processing step for this indicator
Values for the United Kingdom are calculated by Our World in Data from UNODC data for England, Wales, Scotland and Northern Ireland.

Rates for the most recent year are calculated using medium population projection estimates from the United Nations World Population Prospects.


## World region according to OWID
Regions defined by Our World in Data, which are used in OWID charts and maps.
Last updated: January 1, 2023  
Date range: 2023–2023  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Our World in Data – processed by Our World in Data

#### Full citation
Our World in Data – processed by Our World in Data. “World region according to OWID” [dataset]. Our World in Data, “Regions” [original data].
Source: Our World in Data

### Source

#### Our World in Data – Regions


    
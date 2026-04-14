# Share of people who said they were asked for a bribe or paid one - Data package

This data package contains the data that powers the chart ["Share of people who said they were asked for a bribe or paid one"](https://ourworldindata.org/grapher/bribery-prevalence-un?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Share of people who recently paid a bribe or were asked for one
Share of respondents who reported having contact with a public official in the past 12 months and paying or being asked to pay a [bribe](#dod:bribery).
Last updated: October 29, 2025  
Next update: October 2027  
Date range: 2004–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
United Nations Office on Drugs and Crime – with minor processing by Our World in Data

#### Full citation
United Nations Office on Drugs and Crime – with minor processing by Our World in Data. “Share of people who recently paid a bribe or were asked for one” [dataset]. United Nations Office on Drugs and Crime, “Data from multiple sources” [original data].
Source: United Nations Office on Drugs and Crime – with minor processing by Our World In Data

### What you should know about this data
* This indicator measures how common bribery is in people’s everyday interactions with public officials. It shows the share of individuals who, in the past year, either paid a bribe or were asked to pay one during contact with a public official.
* Bribes can take the form of money, gifts, or favors given in exchange for special treatment. The focus is on petty or administrative bribery — the kind people may face when accessing basic services, such as dealing with the police, schools, or healthcare.
* “Public officials” refers to anyone holding a legislative, executive, administrative, or judicial role — including police officers, customs agents, judges, teachers, and doctors. The data does not cover high-level political corruption, trading of influence, or abuse of office.
* Data comes primarily from national surveys, where respondents report their own direct experiences. Reports involving intermediaries (e.g. a bribe paid through someone else) are included, but second-hand accounts from other household members are excluded.
* When national data is unavailable or insufficient, estimates may draw on [Global Corruption Barometer (GCB)](https://www.transparency.org/en/gcb) data, provided it aligns closely with UNODC definitions. These estimates are reviewed and validated by national authorities, usually through national statistics offices.
* In some cases — such as Peru and Panama — UNODC estimates differ significantly from the GCB's figures. These differences may arise from variations in survey scope (e.g. UNODC's surveys inquire about any contact with public officials, while GCB asks about contact concerning a few core services), sample size, how people without recent contact with officials are handled, or how surveys are conducted (e.g. phone vs. in-person).
* Earlier surveys often excluded people who were asked for a bribe but refused to pay. This likely led to underestimates of the prevalence of bribery. The UNODC aims to correct this by applying standardised methods across countries.

### How is this data described by its producer - United Nations Office on Drugs and Crime?
This indicator is defined as the percentage of persons who paid at least one bribe (gave a public official money, a gift or counter favour) to a public official, or were asked for a bribe by these public officials, in the last 12 months, as a percentage of persons who had at least one contact with a public official in the same period.

In the International Classification of Crime for Statistical Purposes (ICCS), bribery is defined as: ‘Promising, offering, giving, soliciting, or accepting an undue advantage to or from a public official or a person who directs or works in a private sector entity, directly or indirectly, in order that the person act or refrain from acting in the exercise of his or her official duties’ (ICCS Category 07031).

This definition is based on definitions of bribery of national public officials, bribery of foreign public officials and official of international organisations and bribery in the private sector that are contained in the United Nations Convention against Corruption (articles 15, 16, and 21). While the concept of bribery is broader, as it includes also actions such as promising or offering, and it covers both public and private sector, this indicator focuses on specific forms of bribery that are more measurable (the giving and/or requesting of bribes) and it limits the scope to the public sector.

The concept of undue advantage is operationalized by reference to giving of money (in addition to an official fee), gifts or provision of a service requested/offered by/to a public official in exchange for a special treatment. This indicator captures the often called ‘administrative bribery’, which is often intended as the type of bribery affecting citizens in their dealings with public administrations and/or civil servants.

For this indicator, public official refers to persons holding a legislative, executive, administrative or judicial office.

In the operationalization of the indicator, a list of selected officials and civil servants is used.

Further information available at: https://unstats.un.org/sdgs/metadata/files/Metadata-16-05-01.pdf

### Source

#### United Nations Office on Drugs and Crime – Data from multiple sources
Retrieved on: 2025-10-29  
Retrieved from: https://unstats.un.org/sdgs/dataportal  


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


    
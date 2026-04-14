# Annual working hours per person employed - Data package

This data package contains the data that powers the chart ["Annual working hours per person employed"](https://ourworldindata.org/grapher/annual-working-hours-per-person-employed?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website. It was downloaded on April 11, 2026.

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


## Average hours worked per person employed
Date range: 1970–2017  
Unit: Hours  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OECD - Productivity - Level of GDP per capita and productivity – processed by Our World in Data

#### Full citation
OECD - Productivity - Level of GDP per capita and productivity – processed by Our World in Data. “Average hours worked per person employed” [dataset]. OECD - Productivity - Level of GDP per capita and productivity [original data].
Source: OECD - Productivity - Level of GDP per capita and productivity – processed by Our World In Data

### Additional information about this data
Abstract
Productivity is considered a central driver of long-term economic growth and living standards.
Contact person/organisation
productivity.contact@oecd.org  The OECD Compendium of Productivity Indicators provides a comprehensive overview of recent and longer term trends in productivity levels and growth in OECD and selected non-OECD countries. The most recent edition of the Compendium, as well as information on the methodologies used in the OECD Productivity Dtabase, are available on the OECD productivity internet page:
OECD productivity internet page
http://www.oecd.org/std/productivity-stats/
Data source(s) used
The indicators presented in this dataset are mainly based on GDP, population and employment statistics from the OECD Annual National Accounts. Hours worked are sourced from the OECD Annual National Accounts, the OECD Employment Outlook and national sources.
Date last updated
Last updated: November 2017.The OECD Productivity Database aims at providing users with the most comprehensive and the latest productivity estimates.  The update cycle is on a rolling basis, i.e. each variable in the dataset is made publicly available as soon as it is updated in the sources databases. However, timely data issues may arise and affect individual series and/or countries. In particular, annual hours worked estimates from the OECD Employment Outlook are typically updated less frequently (once a year, in the summer) than series of hours worked from the OECD Annual National Accounts.  The current version of the OECD Productivity Database accounts for the new changes which have recently occurred in the OECD National Accounts. For further details on methodological changes in OECD Annual National Accounts, go to the following link.
Most countries revised their GDP estimates with the implementation of the 2008 SNA…
http://www.oecd.org/std/na/sna-2008-main-changes.htm
Geographic coverage
* OECD 35 countries; * BRIICS, Colombia and Lithuania; * Geographical / economic zones.
Sector coverage
Total economy.


    
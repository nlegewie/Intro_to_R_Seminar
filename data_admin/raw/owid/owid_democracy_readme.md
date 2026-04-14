# Democracy - Data package

This data package contains the data that powers the chart ["Democracy"](https://ourworldindata.org/explorers/democracy?Dataset=Regimes+of+the+World&Metric=%C2%ADPolitical+regime&Sub-metric=Main+classification&country=ARG~AUS~BWA~CHN~OWID_WRL) on the Our World in Data website. It was downloaded on January 25, 2026.

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


## Political regime
Identifies the political regime of a country by distinguishing between closed autocracies, electoral autocracies, electoral democracies, and liberal democracies.
Last updated: March 17, 2025  
Next update: March 2026  
Date range: 1789–2024  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
V-Dem (2025) – processed by Our World in Data

#### Full citation
V-Dem (2025) – processed by Our World in Data. “Political regime” [dataset]. V-Dem, “Democracy report v15” [original data].
Source: V-Dem (2025) – processed by Our World In Data

### What you should know about this data
* The indicator uses the Regimes of the World classification by political scientists Anna Lührmann, Marcus Tannenberg and Staffan Lindberg.
* The classification distinguishes between closed autocracies (score 0), electoral autocracies (score 1), electoral democracies (score 2), and liberal democracies (score 3).
* In _closed autocracies_, citizens do not have the right to either choose the chief executive of the government or the legislature through multi-party elections.
* In _electoral autocracies_, citizens have the right to choose the chief executive and the legislature through multi-party elections; but they lack some freedoms, such as the freedoms of association or expression, that make the elections meaningful, free, and fair.
* In _electoral democracies_, citizens have the right to participate in meaningful, free and fair, and multi-party elections.
* In _liberal demoracies_, citizens have further individual and minority rights, are equal before the law, and the actions of the executive are constrained by the legislative and the courts.

### Source

#### V-Dem – Democracy report
Retrieved on: 2025-03-17  
Retrieved from: https://v-dem.net/data/the-v-dem-dataset/  

#### Notes on our processing step for this indicator
### Data imputation
We expand the years covered by V-Dem further: To expand the time coverage of today's countries and include more of the period when they were still non-sovereign territories, we identified the historical entity they were a part of and used that regime's data whenever available

For example, V-Dem only provides regime data since Bangladesh's independence in 1971. There is, however, regime data for Pakistan and the colony of India, both of which the current territory of Bangladesh was a part. We, therefore, use the regime data of Pakistan for Bangladesh from 1947 to 1970, and the regime data of India from 1789 to 1946. We did so for all countries with a past or current population of more than one million.

For more details on the imputation methodology and which countries are affected, refer to [this file](https://github.com/owid/etl/blob/master/etl/steps/data/garden/democracy/2025-03-17/vdem/vdem.countries_impute.yml).


    
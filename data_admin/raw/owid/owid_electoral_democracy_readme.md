# Electoral Democracy Index - Data package

This data package contains the data that powers the chart ["Electoral Democracy Index"](https://ourworldindata.org/explorers/democracy?Dataset=Varieties+of+Democracy&Metric=Electoral+democracy&Sub-metric=Main+index&country=ARG~AUS~BWA~CHN~OWID_WRL) on the Our World in Data website.

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


## Electoral democracy index – V-Dem
Central estimate of the extent to which political leaders are elected under comprehensive suffrage in free and fair elections, and freedoms of association and expression are guaranteed.
Last updated: March 17, 2025  
Next update: March 2026  
Date range: 1789–2024  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
V-Dem (2025) – processed by Our World in Data

#### Full citation
V-Dem (2025) – processed by Our World in Data. “Electoral democracy index – V-Dem” [dataset]. V-Dem, “Democracy report v15” [original data].
Source: V-Dem (2025) – processed by Our World In Data

### What you should know about this data
* This index, produced by Varieties of Democracy (V-Dem), is useful if you are interested in big and small differences in democracy, want scores for almost all countries, and prefer a narrow understanding of democracy. For data that focuses on big differences in political systems or has a broad understanding of democracy, other sources will be more useful. You can explore these alternatives in our [Key Democracy Charts](https://ourworldindata.org/democracy#all-charts) and [Democracy Data Explorer](https://ourworldindata.org/explorers/democracy?Dataset=Varieties+of+Democracy&Metric=Electoral+democracy&Sub-metric=Main+index&country=ARG~AUS~BWA~CHN~OWID_WRL).
* It takes a narrow view of democracy by focusing on electoral political institutions: broad voting rights and free, fair, and meaningful elections.
* The index is based mainly on assessments by V-Dem's country experts. It also uses some factual information coded by its own researchers.
* It is made up of five sub-indices: [elected officials](https://ourworldindata.org/grapher/elected-political-leaders-index), [free and fair elections](https://ourworldindata.org/grapher/free-and-fair-elections-index), [freedom of expression](https://ourworldindata.org/grapher/freedom-of-expression-index), [freedom of association](https://ourworldindata.org/grapher/freedom-of-association-index), and the [share of adult citizens who have the right to vote](https://ourworldindata.org/grapher/suffrage).
* V-Dem covers many more countries since 1900, which affects regional averages.
* We provide two kinds of regional averages: **country averages** and **population-weighted averages**. Country averages weigh each country equally and give a sense of how the typical country is doing. Population-weighted averages weigh countries with larger populations more and therefore better reflect the average person's experience.

### How is this data described by its producer - V-Dem (2025)?
Question: To what extent is the ideal of electoral democracy in its fullest sense achieved?
Clarification: The electoral principle of democracy seeks to embody the core value of making rulers responsive to citizens, achieved through electoral competition for the electorate's approval under circumstances when suffrage is extensive; political and civil society organizations can operate freely; elections are clean and not marred by fraud or systematic irregularities; and elections affect the composition of the chief executive of the country. In between elections, there is freedom of expression and an independent media capable of presenting alternative views on matters of political relevance. In the V-Dem conceptual scheme, electoral democracy is understood as an essential element of any other conception of representative democracy — liberal, participatory, deliberative, egalitarian, or some other.

Scale: Interval, from low to high (0-1).

V-Dem indicator name: `v2x_polyarchy`

### Source

#### V-Dem – Democracy report
Retrieved on: 2025-03-17  
Retrieved from: https://v-dem.net/data/the-v-dem-dataset/  

#### Notes on our processing step for this indicator
### Region aggregates
The default regional aggregates (including values for the World) have been estimated by averaging the country values. These are only estimated when data for most countries and populations is available (i.e. 70% for most continents). We have used the list of countries in 1900 as a reference.

In addition, regional aggregates with names like "Region (population-weighted)" (including values for World) have been estimated by averaging the country values weighted by population. The population values are from the UN WPP 2024 revision dataset. These are only estimated when 70% of people in region have data for the given year.

### Data imputation
We expand the years covered by V-Dem further: To expand the time coverage of today's countries and include more of the period when they were still non-sovereign territories, we identified the historical entity they were a part of and used that regime's data whenever available

For example, V-Dem only provides regime data since Bangladesh's independence in 1971. There is, however, regime data for Pakistan and the colony of India, both of which the current territory of Bangladesh was a part. We, therefore, use the regime data of Pakistan for Bangladesh from 1947 to 1970, and the regime data of India from 1789 to 1946. We did so for all countries with a past or current population of more than one million.

For more details on the imputation methodology and which countries are affected, refer to [this file](https://github.com/owid/etl/blob/master/etl/steps/data/garden/democracy/2025-03-17/vdem/vdem.countries_impute.yml).


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


    
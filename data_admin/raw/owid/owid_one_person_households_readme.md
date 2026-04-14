# Percentage of one-person households - Data package

This data package contains the data that powers the chart ["Percentage of one-person households"](https://ourworldindata.org/grapher/one-person-households?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website. It was downloaded on April 11, 2026.

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


## Share of one person households
The percentage of one-person households as a ratio of total households.
Date range: 1864–2018  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OWID based on UN and other sources – processed by Our World in Data

#### Full citation
OWID based on UN and other sources – processed by Our World in Data. “Share of one person households” [dataset]. OWID based on UN and other sources [original data].
Source: OWID based on UN and other sources – processed by Our World In Data

### Additional information about this data
This is an OWID constructed dataset on the share of one-person households.

Estimates rely on data from multiple sources:
- For European countries, the data comes from the <a href="https://ec.europa.eu/eurostat/statistics-explained/index.php/People_in_the_EU_-_statistics_on_household_and_family_structures#Single-person_households">Eurostat dataset</a> using the ilc_lvph02 series.
- Data for <a href="http://nzdotstat.stats.govt.nz/wbos/Index.aspx">New Zealand</a>, <a href="https://www.e-stat.go.jp/en/stat-search/files?page=1&query=household&layout=dataset&toukei=00200521&tstat=000001080615&metadata=1&data=1">Japan</a>, <a href="https://www.census.gov/data/tables/time-series/demo/families/households.html">the US</a>, and <a href="https://quickstats.censusdata.abs.gov.au/census_services/getproduct/census/2001/quickstat/0?opendocument">Australia</a> were taken from the countries' national statistical agencies
- For all other countries the data comes from the <a href="https://population.un.org/Household/index.html#/countries/840">United Nations Database on Household Size and Composition 2018</a>.

The UN database pulls from 4 different sources:
1) Demographic and Health Surveys (DHS);
2) the Demographic Yearbook (DYB) of the United Nations;
3) IPUMS-International;
4) Labor Force Surveys (LFS) of the European Union, Eurostat.

Where a country time series was composed of multiple sources, we favoured the source covering the most years. In cases where there was a tie between sources, we favoured the DYB, then IPUMS, DHS, and lastly LFS estimates. The DYB covered the largest number of countries and the LFS the least.

- Data from the <a href="http://www.oecd.org/els/family/database.htm#structure">OECD</a> was used to supplement the dataset for 2011, for countries where data from other sources were unavailable.
- The time series for Germany was supplemented using the <a href="https://figshare.com/articles/German_Time_Series_Dataset_1834_2012/1450809/1">Deutschland in Daten</a> dataset where West Germany refers to the German Federal Republic series and East Germany to the German Democratic Republic.
See Rahlf, Thomas; Erker, Paul; Fertig, Georg; Rothenbacher, Franz; Oltmer, Jochen; Müller-Benedict, Volker; et al. (2015): German Time Series Dataset, 1834-2012. figshare. Dataset. https://doi.org/10.6084/m9.figshare.1450809.v1

(<em>NB. The source for each observation can be found in the metadata spreadsheet <a href="https://owid.cloud/app/uploads/2019/12/living-alone-metadata-final_country_stan.csv">here</a></em>)

Notes:
The UN data included two observations for Tanzania in 2004 and two for Senegal in 2013. We favoured the observation produced later in the year to avoid under- or over-estimating the share of one-person households. The figures produced later in the year are a more sensible fit for their respective country series.

New Zealand in 1991 and 1996 uses the total number of households as the denominator. All other years use the total number of stated households. Stated households exclude cases where the household composition is unidentifiable and is used where possible.

Japan in 1960, 1970, and 1975 includes "group of six or more one-person live-in employees for business".

United States estimates in 1993 and 2011 are revised based on population from the most recent decennial census.

The OECD-32 average excludes Israel.


    
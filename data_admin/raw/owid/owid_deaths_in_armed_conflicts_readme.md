# Deaths in armed conflicts based on where they occurred - Data package

This data package contains the data that powers the chart ["Deaths in armed conflicts based on where they occurred"](https://ourworldindata.org/explorers/countries-in-conflict-data?Measure=Conflict+deaths&Conflict+type=All+armed+conflicts&Conflict+sub-type=Across+all+sub-types&country=AFG~ETH~SYR~UKR) on the Our World in Data website. It was downloaded on January 23, 2026.

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


## Deaths in ongoing conflicts (best estimate) - Conflict type: all
The best estimate of the number of deaths of combatants and civilians due to fighting in interstate, intrastate, extrasystemic, non-state conflicts, and one-sided violence that were ongoing that year.
Last updated: June 13, 2025  
Date range: 1989–2024  
Unit: deaths  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Uppsala Conflict Data Program (2025); geoBoundaries (2023) – processed by Our World in Data

#### Full citation
Uppsala Conflict Data Program (2025); geoBoundaries (2023) – processed by Our World in Data. “Deaths in ongoing conflicts (best estimate) - Conflict type: all” [dataset]. Uppsala Conflict Data Program, “Georeferenced Event Dataset v25.1”; geoBoundaries, “geoBoundaries - Comprehensive Global Administrative Zones (CGAZ) 6.0.0” [original data].
Source: Uppsala Conflict Data Program (2025), geoBoundaries (2023) – processed by Our World In Data

### What you should know about this data
* An armed conflict is defined by the [Uppsala Conflict Data Program (UCDP)](https://ucdp.uu.se/) as a disagreement between organized groups, or between one organized group and civilians, that causes at least 25 deaths during a year. This includes combatant and civilian deaths due to fighting.
* This includes [interstate conflicts](#dod:interstate-ucdp), [civil conflicts](#dod:intrastate-ucdp), [non-state conflicts](#dod:nonstate-ucdp), [violence against civilians](#dod:onesided-ucdp), and [colonial conflicts](#dod:extrasystemic-ucdp).
* UCDP identifies conflict deaths [based on news reports, other contemporary sources, and academic research](https://www.uu.se/en/department/peace-and-conflict-research/research/ucdp/ucdp-methodology).
* We show here the "best" death estimates as identified by UCDP. They also report high and low estimates.

### Sources

#### Uppsala Conflict Data Program – Georeferenced Event Dataset
Retrieved on: 2025-06-13  
Retrieved from: https://ucdp.uu.se/downloads/index.html#ged_global  

#### geoBoundaries – geoBoundaries - Comprehensive Global Administrative Zones (CGAZ)
Retrieved on: 2025-06-26  
Retrieved from: https://www.geoboundaries.org/globalDownloads.html  

#### Notes on our processing step for this indicator
UCDP provides geographical coordinates of each conflict event. We have mapped these coordinates to countries by means of the geoBoundaries dataset.

In some instances, the event's coordinates fall within the borders of a country. Other times, the event's coordinates fall outside the borders of a country. In the latter case, we have mapped the event to the country that is closest to the event's coordinates.

Conflict event with id "53238" and relid "PAK-2003-1-345-88" was assigned to "Siachen-Saltoro" by geoBoundaries. We have mapped it to "Pakistan" following the text in the `where_description` field from UCDP, which refers to "Giang sector in Siachen, Pakistani Kashmir".


    
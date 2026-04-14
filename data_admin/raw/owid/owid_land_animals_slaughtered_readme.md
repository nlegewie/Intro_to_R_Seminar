# Land animals slaughtered for meat - Data package

This data package contains the data that powers the chart ["Land animals slaughtered for meat"](https://ourworldindata.org/explorers/animal-welfare?Metric=Animals+slaughtered&Animal=All+land+animals&Per+capita=false&country=OWID_WRL~USA~CHN~IND~BRA~GBR) on the Our World in Data website. It was downloaded on January 23, 2026.

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


## Land animals slaughtered for meat
Based on the country of production, not consumption.
Last updated: March 26, 2025  
Next update: March 2026  
Date range: 1961–2023  
Unit: animals  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Food and Agriculture Organization of the United Nations (2025) – processed by Our World in Data

#### Full citation
Food and Agriculture Organization of the United Nations (2025) – processed by Our World in Data. “Land animals slaughtered for meat” [dataset]. Food and Agriculture Organization of the United Nations, “Production: Crops and livestock products” [original data].
Source: Food and Agriculture Organization of the United Nations (2025) – processed by Our World In Data

### What you should know about this data
* Additional deaths that happen during meat and dairy production prior to the slaughter, for example due to disease or accidents, are not included.

### How is this data described by its producer - Food and Agriculture Organization of the United Nations (2025)?
Item: Meat, Total

Description: FAO defines meat as the flesh of animals used for food. In production data, meat is normally reported inclusive of bone and exclusive of meat that is unfit for human consumption. As reported by individual countries, meat production data may refer either to commercial production (meat entering marketing channels), inspected production (from animals slaughtered under sanitary inspection), or total production (the total of the above- mentioned categories plus slaughter for personal consumption). All FAO annual production data refer to total production.Country statistics on meat production adhere to one or more of the following concepts: 1. Live weight: the weight of the animal immediately before slaughter. 2. Killed weight: the live weight less the uncollected blood lost during slaughter. 3. Dressed carcass weight: weight minus all parts - edible and inedible - that are removed in dressing the carcass. The concept varies widely from country to country and according to the various species of livestock. Edible parts generally include edible offals (head or head meat, tongue, brains, heart, liver, spleen, stomach or tripes and, in a few countries, other parts such as feet, throat and lungs. Slaughter fats (the unrendered fats that fall in the course of dressing the carcasses) are recorded as either edible or inedible according to country practice. Inedible parts generally include hides and skins (except in the case of pigs), as well as hoofs and stomach contents.Meat production data for minor animals (poultry, rabbits, etc.) are reported in one of the following three ways: ready-to-cook weight (giblets are sometimes included and sometimes excluded); eviscerated weight (including the feet and head); or dressed weight, i.e. the live weight less the blood, feathers and skin.FAO data relate to dressed carcass weight for livestock and, wherever possible, ready-to- cook weight for poultry.Among individual countries, one of the following three concepts issued to measure production:A. Production from all animals, of both indigenous and foreign origin, that are slaughtered within national boundaries. B. Production from the slaughter of indigenous animals plus exports of live indigenous animals during the reference period. Derived from meat production as follows: production from slaughtered animals plus the meat equivalent of all animals exported alive, minus the meat equivalent of all animals imported alive. As imports/exports of live animals are recorded by FAO in numbers, not weight, animal type and size are of significance. C. The biological production concept covers indigenous animals that are either slaughtered or exported live, plus net additions to the stock during the reference period. Derived from indigenous productions follows: indigenous production plus (or minus) the meat equivalent of the change in the stock numbers during the reference period. Production is expressed in terms of live weight. Changes in the total live weight of all animals are not taken into account.FAO uses the first concept of meat production in the construction of its food balance sheets and for related indicators. The second concept, indigenous meat production, in measuring the output of the national livestock sector, is useful mainly in the construction of index numbers of agricultural production. The third concept, biological production, would be the most complete as it also reflects changes in the livestock herd, but it is not used because of difficulties in obtaining information from national reporting offices. The prices applied to indigenous meat production are derived from prices of live animals. This covers not only the value of meat, but also the value of offals, fats, hides and skins.

Metric: Producing Animals/Slaughtered

### Source

#### Food and Agriculture Organization of the United Nations – Production: Crops and livestock products
Retrieved on: 2025-03-17  
Retrieved from: http://www.fao.org/faostat/en/#data/QCL  


    
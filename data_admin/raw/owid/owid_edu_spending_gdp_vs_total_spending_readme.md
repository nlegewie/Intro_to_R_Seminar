# Share of GDP spent on education vs. share of government spending assigned to education - Data package

This data package contains the data that powers the chart ["Share of GDP spent on education vs. share of government spending assigned to education"](https://ourworldindata.org/grapher/share-edu-spending-gdp-vs-share-edu-total-spending?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Expenditure on education as share of government spending
Percentage of total [general government](#dod:general-government) spending (across all sectors) that is allocated to education.
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1980–2025  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Expenditure on education as share of government spending” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* This indicator shows how much of a government’s overall budget is allocated to education. It reflects the priority given to education relative to other sectors such as health, infrastructure, defence, or social protection.
* It is calculated by dividing total government expenditure on education (across all education levels) by total general government expenditure, and expressing the result as a percentage. The spending figures include budgets from central, regional, and local authorities, where available.
* A higher percentage suggests that education is a higher fiscal priority within national budgets. Lower values may reflect limited resources, competing demands from other sectors, or different demographic and policy contexts.
* While this indicator enables useful cross-country comparisons, results should be interpreted with caution. National budget structures, spending classifications, and demographic differences can all affect the comparability of figures. For example, countries with younger populations may naturally devote more resources to education, while ageing populations may drive higher spending on healthcare or pensions.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Government spending on education as share of GDP
Total annual [general government](#dod:general-government) spending on all levels of education, expressed as a percentage of [GDP](#dod:gdp).
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: % of GDP  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Government spending on education as share of GDP” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* This indicator shows the share of a country’s total economic output (GDP) that is spent on education annually. It reflects the scale of education spending relative to the size of the economy.
* It includes all government spending at the relevant education level — from central, regional, and local authorities — and covers both current and capital expenditures.
* It covers all types of public education spending — including teacher salaries, textbooks, school maintenance, capital projects such as building classrooms, and even external funding from international donors that is channeled through government budgets.
* A higher percentage means a larger share of national resources is allocated to education, which may indicate political commitment or policy prioritization. But it doesn’t necessarily mean higher spending per student or better outcomes. Countries with lower GDPs might have high percentages but limited resources in absolute terms.
* This indicator is useful for understanding how education fits within the broader picture of government spending and national development. It should be interpreted alongside measures like per-student spending and enrollment rates.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


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


    
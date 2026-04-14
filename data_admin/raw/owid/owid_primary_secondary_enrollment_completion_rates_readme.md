# Primary, secondary and tertiary education enrollment and completion rates - Data package

This data package contains the data that powers the chart ["Primary, secondary and tertiary education enrollment and completion rates"](https://ourworldindata.org/grapher/primary-secondary-enrollment-completion-rates?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Gross enrollment ratio in primary education
Number of children of any age group who are enrolled in [primary](#dod:primary-education) education, expressed as a percentage of the total population of the official primary school age.
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Gross enrollment ratio in primary education” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The gross enrollment ratio counts all students enrolled at a specific education level, regardless of their age. This includes students who are younger or older than the official age range because they started school early, started late, or repeated grades.
* It measures enrollment at a given level by dividing the total number of students—of any age—by the size of the age group officially assigned to that level. For instance, primary enrollment counts everyone enrolled, even outside ages 6–11, but compares it only to the 6–11 population.
* Values can exceed 100% when students repeat grades or start late. For instance, primary school enrollment might include 12- or 13-year-olds who started late or repeated grades, pushing the ratio above 100%.
* A value of 100% does not guarantee that all children in the official age group are enrolled in school; some may be out of school entirely, but the ratio appears high due to older students being counted in the total.
* Values much lower than 100% indicate that many children of the official age are not enrolled at the expected education level - they may be out of school entirely, enrolled at a different level, or have never started school.
* Values much higher than 100% can indicate educational challenges such as high grade repetition rates, late school entry, or inefficient progression through the system.
* The data comes from administrative records such as school enrollment reports, combined with population estimates typically sourced from the United Nations or national statistical offices.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total enrollment in primary education, regardless of age, expressed as a percentage of the population of official primary education age. GER can exceed 100% due to the inclusion of over-aged and under-aged students because of early or late school entrance and grade repetition.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Secondary enrolment
Number of children of any age group who are enrolled in [secondary](#dod:secondary-education) education expressed as a percentage of the total population of the official secondary school age.
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Secondary enrolment” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The gross enrollment ratio counts all students enrolled at a specific education level, regardless of their age. This includes students who are younger or older than the official age range because they started school early, started late, or repeated grades.
* It measures enrollment at a given level by dividing the total number of students—of any age—by the size of the age group officially assigned to that level. For instance, primary enrollment counts everyone enrolled, even outside ages 6–11, but compares it only to the 6–11 population.
* Values can exceed 100% when students repeat grades or start late. For instance, primary school enrollment might include 12- or 13-year-olds who started late or repeated grades, pushing the ratio above 100%.
* A value of 100% does not guarantee that all children in the official age group are enrolled in school; some may be out of school entirely, but the ratio appears high due to older students being counted in the total.
* Values much lower than 100% indicate that many children of the official age are not enrolled at the expected education level - they may be out of school entirely, enrolled at a different level, or have never started school.
* Values much higher than 100% can indicate educational challenges such as high grade repetition rates, late school entry, or inefficient progression through the system.
* The data comes from administrative records such as school enrollment reports, combined with population estimates typically sourced from the United Nations or national statistical offices.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total enrollment in secondary education, regardless of age, expressed as a percentage of the population of official secondary education age. GER can exceed 100% due to the inclusion of over-aged and under-aged students because of early or late school entrance and grade repetition.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Gross enrollment ratio in tertiary education
Number of people of any age group who are enrolled in [tertiary](#dod:tertiary-education) education, expressed as a percentage of the total population of the five-year age group following on from secondary school leaving.
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2025  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Gross enrollment ratio in tertiary education” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The gross enrollment ratio counts all students enrolled at a specific education level, regardless of their age. This includes students who are younger or older than the official age range because they started school early, started late, or repeated grades.
* It measures enrollment at a given level by dividing the total number of students—of any age—by the size of the age group officially assigned to that level. For instance, primary enrollment counts everyone enrolled, even outside ages 6–11, but compares it only to the 6–11 population.
* Values can exceed 100% when students repeat grades or start late. For instance, primary school enrollment might include 12- or 13-year-olds who started late or repeated grades, pushing the ratio above 100%.
* A value of 100% does not guarantee that all children in the official age group are enrolled in school; some may be out of school entirely, but the ratio appears high due to older students being counted in the total.
* Values much lower than 100% indicate that many children of the official age are not enrolled at the expected education level - they may be out of school entirely, enrolled at a different level, or have never started school.
* Values much higher than 100% can indicate educational challenges such as high grade repetition rates, late school entry, or inefficient progression through the system.
* The data comes from administrative records such as school enrollment reports, combined with population estimates typically sourced from the United Nations or national statistical offices.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total enrollment in tertiary education (ISCED 5 to 8), regardless of age, expressed as a percentage of the total population of the five-year age group following on from secondary school leaving.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Primary completion
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1996–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Primary completion” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
The number of persons in the relevant age group who have completed the last grade of the given level of education is expressed as a percentage of the total population (in the survey sample) of the same age group. The primary completion rate is the percentage of a cohort of children or young people aged 3-5 years above the intended age for the last grade of primary education who have completed that grade. The intended age for the last grade of primary education is the age at which pupils would enter the grade if they had started school at the official primary entrance age, had studied full-time and had progressed without repeating or skipping a grade. For example, if the official age of entry into primary education is 6 years, and if primary education has 6 grades, the intended age for the last grade of primary education is 11 years. In this case, 14-16 years (11 + 3 = 14 and 11 + 5 = 16) would be the reference age group for calculation of the primary completion rate. For more information, consult the UNESCO Institute of Statistics website: http://www.uis.unesco.org/Education/

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Lower secondary completion
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1996–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Lower secondary completion” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
The number of persons in the relevant age group who have completed the last grade of the given level of education is expressed as a percentage of the total population (in the survey sample) of the same age group. The primary completion rate is the percentage of a cohort of children or young people aged 3-5 years above the intended age for the last grade of primary education who have completed that grade. The intended age for the last grade of primary education is the age at which pupils would enter the grade if they had started school at the official primary entrance age, had studied full-time and had progressed without repeating or skipping a grade. For example, if the official age of entry into primary education is 6 years, and if primary education has 6 grades, the intended age for the last grade of primary education is 11 years. In this case, 14-16 years (11 + 3 = 14 and 11 + 5 = 16) would be the reference age group for calculation of the primary completion rate. For more information, consult the UNESCO Institute of Statistics website: http://www.uis.unesco.org/Education/

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


    
# Gender gap in primary, secondary and tertiary education - Data package

This data package contains the data that powers the chart ["Gender gap in primary, secondary and tertiary education"](https://ourworldindata.org/grapher/gender-gap-education-levels?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Girls in tertiary education
Last updated: July 17, 2023  
Date range: 1820–2022  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Multiple sources compiled by World Bank (2024); Lee and Lee (2016) – with major processing by Our World in Data

#### Full citation
Multiple sources compiled by World Bank (2024); Lee and Lee (2016) – with major processing by Our World in Data. “Girls in tertiary education” [dataset]. UNESCO Institute for Statistics, “World Development Indicators”; Lee and Lee, “Human Capital in the Long Run” [original data].
Source: Multiple sources compiled by World Bank (2024), Lee and Lee (2016) – with major processing by Our World In Data

### What you should know about this data
* Total enrolment in tertiary education regardless of age expressed as a percentage of the population in the 5-year age group immediately following upper secondary education.

### How is this data described by its producer - Multiple sources compiled by World Bank (2024), Lee and Lee (2016)?
Gross enrollment ratio is the ratio of total enrollment, regardless of age, to the population of the age group that officially corresponds to the level of education shown. Tertiary education, whether or not to an advanced research qualification, normally requires, as a minimum condition of admission, the successful completion of education at the secondary level.

Limitations and exceptions: Enrollment indicators are based on annual school surveys, but do not necessarily reflect actual attendance or dropout rates during the year. Also, the length of education differs across countries and can influence enrollment rates, although the International Standard Classification of Education (ISCED) tries to minimize the difference. For example, a shorter duration for primary education tends to increase the rate; a longer one to decrease it (in part because older children are more at risk of dropping out). Moreover, age at enrollment may be inaccurately estimated or misstated, especially in communities where registration of births is not strictly enforced.

Statistical concept and methodology: Gross enrollment ratio for tertiary school is calculated by dividing the number of students enrolled in tertiary education regardless of age by the population of the age group which officially corresponds to tertiary education, and multiplying by 100.

Data on education are collected by the UNESCO Institute for Statistics from official responses to its annual education survey. All the data are mapped to the International Standard Classification of Education (ISCED) to ensure the comparability of education programs at the international level. The current version was formally adopted by UNESCO Member States in 2011. Population data are drawn from the United Nations Population Division. Using a single source for population data standardizes definitions, estimations, and interpolation methods, ensuring a consistent methodology across countries and minimizing potential enumeration problems in national censuses.

The reference years reflect the school year for which the data are presented. In some countries the school year spans two calendar years (for example, from September 2010 to June 2011); in these cases the reference year refers to the year in which the school year ended (2011 in the example).

### Sources

#### UNESCO Institute for Statistics – World Development Indicators
Retrieved on: 2024-05-20  
Retrieved from: https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators  

#### Lee and Lee – Human Capital in the Long Run
Retrieved on: 2023-11-20  
Retrieved from: https://barrolee.github.io/BarroLeeDataSet/DataLeeLee.html  

#### Notes on our processing step for this indicator
Historical data up to the year 1985 has been sourced from 'Human Capital in the Long Run' by Lee and Lee (2016). This historical data was then combined with recent estimates provided by the World Bank.

For the period before 1985, regional aggregates were computed by Our World in Data through yearly population-weighted averages, where annual values are proportionally adjusted to emphasize the influence of larger populations.


## Boys in tertiary education
Last updated: July 17, 2023  
Date range: 1820–2022  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Multiple sources compiled by World Bank (2024); Lee and Lee (2016) – with major processing by Our World in Data

#### Full citation
Multiple sources compiled by World Bank (2024); Lee and Lee (2016) – with major processing by Our World in Data. “Boys in tertiary education” [dataset]. UNESCO Institute for Statistics, “World Development Indicators”; Lee and Lee, “Human Capital in the Long Run” [original data].
Source: Multiple sources compiled by World Bank (2024), Lee and Lee (2016) – with major processing by Our World In Data

### What you should know about this data
* Total enrolment in tertiary education regardless of age expressed as a percentage of the population in the 5-year age group immediately following upper secondary education.

### How is this data described by its producer - Multiple sources compiled by World Bank (2024), Lee and Lee (2016)?
Gross enrollment ratio is the ratio of total enrollment, regardless of age, to the population of the age group that officially corresponds to the level of education shown. Tertiary education, whether or not to an advanced research qualification, normally requires, as a minimum condition of admission, the successful completion of education at the secondary level.

Limitations and exceptions: Enrollment indicators are based on annual school surveys, but do not necessarily reflect actual attendance or dropout rates during the year. Also, the length of education differs across countries and can influence enrollment rates, although the International Standard Classification of Education (ISCED) tries to minimize the difference. For example, a shorter duration for primary education tends to increase the rate; a longer one to decrease it (in part because older children are more at risk of dropping out). Moreover, age at enrollment may be inaccurately estimated or misstated, especially in communities where registration of births is not strictly enforced.

Statistical concept and methodology: Gross enrollment ratio for tertiary school is calculated by dividing the number of students enrolled in tertiary education regardless of age by the population of the age group which officially corresponds to tertiary education, and multiplying by 100.

Data on education are collected by the UNESCO Institute for Statistics from official responses to its annual education survey. All the data are mapped to the International Standard Classification of Education (ISCED) to ensure the comparability of education programs at the international level. The current version was formally adopted by UNESCO Member States in 2011. Population data are drawn from the United Nations Population Division. Using a single source for population data standardizes definitions, estimations, and interpolation methods, ensuring a consistent methodology across countries and minimizing potential enumeration problems in national censuses.

The reference years reflect the school year for which the data are presented. In some countries the school year spans two calendar years (for example, from September 2010 to June 2011); in these cases the reference year refers to the year in which the school year ended (2011 in the example).

### Sources

#### UNESCO Institute for Statistics – World Development Indicators
Retrieved on: 2024-05-20  
Retrieved from: https://datacatalog.worldbank.org/search/dataset/0037712/World-Development-Indicators  

#### Lee and Lee – Human Capital in the Long Run
Retrieved on: 2023-11-20  
Retrieved from: https://barrolee.github.io/BarroLeeDataSet/DataLeeLee.html  

#### Notes on our processing step for this indicator
Historical data up to the year 1985 has been sourced from 'Human Capital in the Long Run' by Lee and Lee (2016). This historical data was then combined with recent estimates provided by the World Bank.

For the period before 1985, regional aggregates were computed by Our World in Data through yearly population-weighted averages, where annual values are proportionally adjusted to emphasize the influence of larger populations.


## Net enrollment rate in primary education among girls
Percentage of girls of official primary school age who are enrolled in [primary education](#dod:primary-education).
Last updated: July 17, 2023  
Date range: 1820–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025); Lee and Lee (2016) – with major processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025); Lee and Lee (2016) – with major processing by Our World in Data. “Net enrollment rate in primary education among girls” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education”; Lee and Lee, “Human Capital in the Long Run” [original data].
Source: UNESCO Institute for Statistics (2025), Lee and Lee (2016) – with major processing by Our World In Data

### What you should know about this data
* Net enrollment rate for primary school is calculated by dividing the number of students of official school age enrolled in primary education by the population of the age group which officially corresponds to primary education, and multiplying by 100.

### How is this data described by its producer - UNESCO Institute for Statistics (2025), Lee and Lee (2016)?
Total number of female students of the official age group for primary education who are enrolled in any level of education, expressed as a percentage of the corresponding female population. Divide the total number of female students in the official school age range for primary education who are enrolled in any level of education by the female population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for primary education is due to enrolment in pre-primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes.

### Sources

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  

#### Lee and Lee – Human Capital in the Long Run
Retrieved on: 2023-11-20  
Retrieved from: https://barrolee.github.io/BarroLeeDataSet/DataLeeLee.html  

#### Notes on our processing step for this indicator
Historical data up to the year 1985 has been sourced from 'Human Capital in the Long Run' by Lee and Lee (2016). This historical data was then combined with recent estimates provided by the World Bank.

For the period before 1985, regional aggregates were computed by Our World in Data through yearly population-weighted averages, where annual values are proportionally adjusted to emphasize the influence of larger populations.


## Net enrollment rate in primary education among boys
Percentage of boys of official primary school age who are enrolled in [primary education](#dod:primary-education).
Last updated: July 17, 2023  
Date range: 1820–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025); Lee and Lee (2016) – with major processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025); Lee and Lee (2016) – with major processing by Our World in Data. “Net enrollment rate in primary education among boys” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education”; Lee and Lee, “Human Capital in the Long Run” [original data].
Source: UNESCO Institute for Statistics (2025), Lee and Lee (2016) – with major processing by Our World In Data

### What you should know about this data
* Net enrollment rate for primary school is calculated by dividing the number of students of official school age enrolled in primary education by the population of the age group which officially corresponds to primary education, and multiplying by 100.

### How is this data described by its producer - UNESCO Institute for Statistics (2025), Lee and Lee (2016)?
Total number of male students of the official age group for primary education who are enrolled in any level of education, expressed as a percentage of the corresponding male population. Divide the total number of male students in the official school age range for primary education who are enrolled in any level of education by the male population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for primary education is due to enrolment in pre-primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes.

### Sources

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  

#### Lee and Lee – Human Capital in the Long Run
Retrieved on: 2023-11-20  
Retrieved from: https://barrolee.github.io/BarroLeeDataSet/DataLeeLee.html  

#### Notes on our processing step for this indicator
Historical data up to the year 1985 has been sourced from 'Human Capital in the Long Run' by Lee and Lee (2016). This historical data was then combined with recent estimates provided by the World Bank.

For the period before 1985, regional aggregates were computed by Our World in Data through yearly population-weighted averages, where annual values are proportionally adjusted to emphasize the influence of larger populations.


## Net enrollment rate in lower secondary education among boys
Percentage of boys of official lower secondary school age who are enrolled in [lower secondary education](#dod:lower-secondary-education).
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Net enrollment rate in lower secondary education among boys” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The net enrollment rate shows what percentage of children are enrolled at the education level intended for their age.
* It compares children enrolled at the correct level for their age to the total population in that same age group. For example, a primary school net enrollment of 90% means 90% of children between the ages of 6 and 11 years are enrolled in primary school. Children who are not enrolled in school or are enrolled at another education level are not counted here.
* The highest possible value is 100%, which would mean all children of the right age are enrolled where they should be. High rates indicate that most children are progressing through school at the expected pace.
* A rate of 90% doesn't necessarily mean 10% of children are out of school entirely — some may be enrolled at different levels (either higher or lower) than expected for their age, but these students aren't counted in the net rate.
* The data comes from school administrative records that track enrollment by individual age, combined with population estimates from national statistics offices or UN sources.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total number of male students of the official age group for lower secondary education who are enrolled in any level of education, expressed as a percentage of the corresponding male population. Divide the total number of male students in the official school age range for lower secondary education who are enrolled in any level of education by the male population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for lower secondary education is due to enrolment in pre-primary or primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Net enrollment rate in lower secondary education among girls
Percentage of girls of official lower secondary school age who are enrolled in [lower secondary education](#dod:lower-secondary-education).
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Net enrollment rate in lower secondary education among girls” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The net enrollment rate shows what percentage of children are enrolled at the education level intended for their age.
* It compares children enrolled at the correct level for their age to the total population in that same age group. For example, a primary school net enrollment of 90% means 90% of children between the ages of 6 and 11 years are enrolled in primary school. Children who are not enrolled in school or are enrolled at another education level are not counted here.
* The highest possible value is 100%, which would mean all children of the right age are enrolled where they should be. High rates indicate that most children are progressing through school at the expected pace.
* A rate of 90% doesn't necessarily mean 10% of children are out of school entirely — some may be enrolled at different levels (either higher or lower) than expected for their age, but these students aren't counted in the net rate.
* The data comes from school administrative records that track enrollment by individual age, combined with population estimates from national statistics offices or UN sources.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total number of female students of the official age group for lower secondary education who are enrolled in any level of education, expressed as a percentage of the corresponding female population. Divide the total number of female students in the official school age range for lower secondary education who are enrolled in any level of education by the female population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for lower secondary education is due to enrolment in pre-primary or primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes.

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Net enrollment rate in upper secondary education among boys
Percentage of boys of official upper secondary school age who are enrolled in [upper secondary education](#dod:upper-secondary-education).
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Net enrollment rate in upper secondary education among boys” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The net enrollment rate shows what percentage of children are enrolled at the education level intended for their age.
* It compares children enrolled at the correct level for their age to the total population in that same age group. For example, a primary school net enrollment of 90% means 90% of children between the ages of 6 and 11 years are enrolled in primary school. Children who are not enrolled in school or are enrolled at another education level are not counted here.
* The highest possible value is 100%, which would mean all children of the right age are enrolled where they should be. High rates indicate that most children are progressing through school at the expected pace.
* A rate of 90% doesn't necessarily mean 10% of children are out of school entirely — some may be enrolled at different levels (either higher or lower) than expected for their age, but these students aren't counted in the net rate.
* The data comes from school administrative records that track enrollment by individual age, combined with population estimates from national statistics offices or UN sources.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total number of male students of the official age group for upper secondary education who are enrolled in any level of education, expressed as a percentage of the corresponding male population. Divide the total number of male students in the official school age range for upper secondary education who are enrolled in any level of education by the male population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for upper secondary education is due to enrolment in pre-primary or primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes. For more information, consult the UIS website: http://www.uis.unesco.org/Education/

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


## Net enrollment rate in upper secondary education among girls
Percentage of girls of official upper secondary school age who are enrolled in [upper secondary education](#dod:upper-secondary-education).
Last updated: May 1, 2025  
Next update: May 2026  
Date range: 1970–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data

#### Full citation
UNESCO Institute for Statistics (2025) – with minor processing by Our World in Data. “Net enrollment rate in upper secondary education among girls” [dataset]. UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO Institute for Statistics (2025) – with minor processing by Our World In Data

### What you should know about this data
* The net enrollment rate shows what percentage of children are enrolled at the education level intended for their age.
* It compares children enrolled at the correct level for their age to the total population in that same age group. For example, a primary school net enrollment of 90% means 90% of children between the ages of 6 and 11 years are enrolled in primary school. Children who are not enrolled in school or are enrolled at another education level are not counted here.
* The highest possible value is 100%, which would mean all children of the right age are enrolled where they should be. High rates indicate that most children are progressing through school at the expected pace.
* A rate of 90% doesn't necessarily mean 10% of children are out of school entirely — some may be enrolled at different levels (either higher or lower) than expected for their age, but these students aren't counted in the net rate.
* The data comes from school administrative records that track enrollment by individual age, combined with population estimates from national statistics offices or UN sources.

### How is this data described by its producer - UNESCO Institute for Statistics (2025)?
Total number of female students of the official age group for upper secondary education who are enrolled in any level of education, expressed as a percentage of the corresponding female population. Divide the total number of female students in the official school age range for upper secondary education who are enrolled in any level of education by the female population of the same age group and multiply the result by 100. The difference between the total NER and the adjusted NER provides a measure of the proportion of children in the official relevant school age group who are enrolled in levels of education below the one intended for their age. The difference between the total NER and the adjusted NER for upper secondary education is due to enrolment in pre-primary or primary education. The total NER should be based on total enrolment of the official relevant school age group in any level of education for all types of schools and education institutions, including public, private and all other institutions that provide organized educational programmes. For more information, consult the UIS website: http://www.uis.unesco.org/Education/

### Source

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  


    
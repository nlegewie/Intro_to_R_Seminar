# Homelessness rate - Data package

This data package contains the data that powers the chart ["Homelessness rate"](https://ourworldindata.org/grapher/homelessness-rate-point-in-time-count?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Rate of people experiencing homelessness (ETHOS 1)
Includes people living in the streets or public spaces without a shelter that can be defined as living quarters. This data is collected at a single point in time, generally through a coordinated street count.
Last updated: April 30, 2024  
Next update: May 2026  
Date range: 2017–2023  
Unit: people in homelessness per 100,000 population  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OECD (2024) – with major processing by Our World in Data

#### Full citation
OECD (2024) – with major processing by Our World in Data. “Rate of people experiencing homelessness (ETHOS 1)” [dataset]. OECD, “OECD Affordable Housing Database (AHD)” [original data].
Source: OECD (2024) – with major processing by Our World In Data

### What you should know about this data
* This data has been categorized within the European Typology of Homelessness and Housing Exclusion (ETHOS) typology as _ETHOS Light 1_. ETHOS Light 1 is defined as people living rough, living in the streets or public spaces without a shelter that can be defined as living quarters.
* This data is collected with a _point-in-time count_, in which data are collected at a single point in time, generally through a coordinated street count or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.
* Countries use different definitions and data collection methods and are harmonized to the extent possible.
* Data for Australia, Canada, France, Germany, South Korea, Norway, and the United States includes people living in unconventional dwellings (e.g. tents).
* Data for the United Kingdom only considers England and refers to the number of households experiencing homelessness per 100,000 households.
* Data for France exclude asylum seekers to facilitate cross-country comparison.
* More details about definitions, methodology and comparability issues can be found in the [OECD Population Experiencing Homelessness documentation](https://www.oecd.org/els/family/HC3-1-Population-experiencing-homelessness.pdf).
* For more information on the statistical definitions for each country, please check the [OECD's Country Notes on Homelessness data](https://www.oecd.org/social/homelessness-country-notes.htm).

### How is this data described by its producer - OECD (2024)?
_Definitions and methodology_

This indicator presents available data at national level on the number of people experiencing homelessness as reported by public authorities in OECD and EU countries. Data are drawn from the 2023 OECD Questionnaire on Affordable and Social Housing (QuASH 2023) and other available sources. Overall, homelessness data are available for 40 countries: all OECD countries except Hungary; and the following non-member countries: Croatia, Cyprus and Romania (Table HC 3.1.A1).

Comparing homeless estimates across countries is difficult, as countries do not define or count the population experiencing homelessness in the same way. There is no internationally agreed definition of homelessness. Therefore, this indicator presents a collection of available statistics on homelessness in OECD, EU and key partner countries in line with national definitions, drawing on the ETHOS Light typology to the extent feasible (see Box HC 3.1).

In general, the type of count can be differentiated between point-in-time counts and flow counts, which are defined below:

- Point-in-time count: Data are collected at a single point-in-time, generally through a coordinated street count and/or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.

- Flow count: Data are collected over a given period of time, such as the enumeration of all people who have stayed in a shelter over the course of the year. Point-in-time and flow data are not comparable, and are thus presented separately in this indicator. For additional discussion of the methodological challenges to homelessness data collection, see the section on Data and comparability issues below.

_Data and comparability issues_

_Significant methodological challenges stymy data collection on homelessness._

_Definitional differences_

As discussed above, differences in statistical definitions drive some of the variation in the reported incidence of homelessness across countries; these differences hamper international comparison and an understanding of the differences in homelessness rates and risks across countries. For instance, several countries that adopt a broader definition of homelessness report a higher incidence of homelessness, like Australia and New Zealand, relative to countries with a narrower definition, such as Chile, Portugal or Japan.

However, definitional differences do not fully explain the variation in homelessness rates across countries: several countries with a broad definition of homelessness report among the lowest incidences of homelessness, such as Norway, Poland, Finland and Denmark. Figure HC3.1 (above) accounts for these definitional differences by presenting cross-country data on homelessness for ETHOS Light categories 1, 2 and 3 only.

Different definitions of homelessness can co-exist within the same country, depending on the purpose and the collecting authority, producing considerable differences in homelessness estimates for the same territory. In the United States, for instance, the definition of homelessness used by the Department of Housing and Urban Development (HUD) – which is used to allocate federal funds to local authorities to address homelessness – is narrower than that used by the Department of Education (Evans, Phillips and Ruffini, 2019), which forms the basis of funding allocation to school districts to support children and youth experiencing homelessness. The result is two significantly different estimates of homelessness in the United States: while HUD estimated that over 580 000 people experienced homelessness on a single night in January 2022, the Department of Education reported 1.28 million children and youth nationally experienced homelessness at some point over the 2019-20 school year (this figure is exclusive of their parents) (US Interagency Council on Homelessness, 2024).

_Limitations of data collection approaches_

Beyond definitional differences, there are a number of challenges in the scope and methods of data collection that might affect measuring the full extent of homelessness (see the forthcoming OECD Monitoring Framework on Homelessness). Data on homelessness are typically based on the following collection methods, each with its strengths and limitations in terms of how well it captures different types of living situations:

- Street counts: an estimate of the number of people sleeping rough at a point-in-time;

- Service-based methods: information obtained from a broad range of service providers that support people experiencing homelessness;

- Population censuses and Household surveys: a count or a sample of a given population at a point in time (e.g. Population Census; special module on homelessness in household survey);

- Administrative data: records collected by different institutions/organisations (e.g., health data, criminal justice records, social services data, etc.) and used to extrapolate the number of people experiencing homelessness;

- Advanced sampling methods: a statistical method, such as “capture-recapture,” comparing independent samples from two or more sources of data to estimate the total number of people experiencing homelessness;

- By-name lists and Information management systems on homeless individuals: the collection of comprehensive demographic and identifying information on people experiencing homelessness, which may be collected via registry weeks.

The type of housing solution of someone experiencing homelessness – whether it is a shelter or emergency accommodation service, temporary lodging with family or friends, or living out of a car or on the street – will be better reflected in some data collection methods relative to others. Further, the scope, design and implementation of each data collection approach varies widely, which can significantly affect the quality and coverage of the data. For instance, with respect to street counts, the geographic perimeter is not systematic across (or even within) countries. In addition to counting rough sleepers on public streets, street counts may (or may not) include parks, public transport, emergency rooms, parking garages or other places that, depending on the country context, may be used by rough sleepers.

Moreover, in the case of service-based methods, there is no systematic approach to determining which types of services and emergency or temporary accommodation are included in data collection efforts, and which are left out. The selection of services to be surveyed may be narrowly defined (e.g., restricted to overnight shelters and temporary accommodation), or may be quite broad (e.g., to also include food banks, social service centres, health clinics, etc.). As a result, homelessness data resulting from service-based methods (often captured by ETHOS Light 2 and 3) are not fully comparable across countries. Table HC3.1.1 provides an overview of cross-country differences in the inclusion of children and temporary accommodation for specific groups in the national headline estimate of homelessness.

Across 40 OECD and EU countries:
- Over half (26 countries) include children under the age of 18 years;

- Around 40% (17 countries) include temporary accommodation for victims of domestic violence;

- Around 30% (12 countries) include temporary accommodation for refugees; and

- Less than a quarter (9 countries) include temporary accommodation for asylum seekers.

### Source

#### OECD – OECD Affordable Housing Database (AHD)
Retrieved on: 2024-05-24  
Retrieved from: https://www.oecd.org/housing/data/affordable-housing-database/  

#### Notes on our processing step for this indicator
We have transformed the data from homelessness per 10,000 population to homeless per 100,000 population.

We have included the years the data has been captured for each country, according to the source's notes. Whenever the data was captured over different years, we have included the latest year.


## Rate of people experiencing homelessness (ETHOS 2 and 3)
Includes people living in emergency accommodation, people with no place of usual residence who move frequently between various types of accommodation, and people living in accommodation for the homeless. This data is collected at a single point in time, generally through a coordinated street count.
Last updated: April 30, 2024  
Next update: May 2026  
Date range: 2017–2023  
Unit: people in homelessness per 100,000 population  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OECD (2024) – with major processing by Our World in Data

#### Full citation
OECD (2024) – with major processing by Our World in Data. “Rate of people experiencing homelessness (ETHOS 2 and 3)” [dataset]. OECD, “OECD Affordable Housing Database (AHD)” [original data].
Source: OECD (2024) – with major processing by Our World In Data

### What you should know about this data
* This data has been categorized within the European Typology of Homelessness and Housing Exclusion (ETHOS) typology as _ETHOS Light 2 and 3_. ETHOS Light 2 is defined as people living in emergency accommodation, people with no place of usual residence who move frequently between various types of accommodation. ETHOS Light 3 is defined as people living in accommodation for the homeless, including hostels, temporary and transitional accommodation, and women's shelters or refuge accommodation.
* This data is collected with a _point-in-time count_, in which data are collected at a single point in time, generally through a coordinated street count or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.
* Countries use different definitions and data collection methods and are harmonized to the extent possible.
* Data for Australia, Canada, France, Germany, South Korea, Norway, and the United States includes people living in unconventional dwellings (e.g. tents).
* Data for the United Kingdom only considers England and refers to the number of households experiencing homelessness per 100,000 households.
* Data for France exclude asylum seekers to facilitate cross-country comparison.
* More details about definitions, methodology and comparability issues can be found in the [OECD Population Experiencing Homelessness documentation](https://www.oecd.org/els/family/HC3-1-Population-experiencing-homelessness.pdf).
* For more information on the statistical definitions for each country, please check the [OECD's Country Notes on Homelessness data](https://www.oecd.org/social/homelessness-country-notes.htm).

### How is this data described by its producer - OECD (2024)?
_Definitions and methodology_

This indicator presents available data at national level on the number of people experiencing homelessness as reported by public authorities in OECD and EU countries. Data are drawn from the 2023 OECD Questionnaire on Affordable and Social Housing (QuASH 2023) and other available sources. Overall, homelessness data are available for 40 countries: all OECD countries except Hungary; and the following non-member countries: Croatia, Cyprus and Romania (Table HC 3.1.A1).

Comparing homeless estimates across countries is difficult, as countries do not define or count the population experiencing homelessness in the same way. There is no internationally agreed definition of homelessness. Therefore, this indicator presents a collection of available statistics on homelessness in OECD, EU and key partner countries in line with national definitions, drawing on the ETHOS Light typology to the extent feasible (see Box HC 3.1).

In general, the type of count can be differentiated between point-in-time counts and flow counts, which are defined below:

- Point-in-time count: Data are collected at a single point-in-time, generally through a coordinated street count and/or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.

- Flow count: Data are collected over a given period of time, such as the enumeration of all people who have stayed in a shelter over the course of the year. Point-in-time and flow data are not comparable, and are thus presented separately in this indicator. For additional discussion of the methodological challenges to homelessness data collection, see the section on Data and comparability issues below.

_Data and comparability issues_

_Significant methodological challenges stymy data collection on homelessness._

_Definitional differences_

As discussed above, differences in statistical definitions drive some of the variation in the reported incidence of homelessness across countries; these differences hamper international comparison and an understanding of the differences in homelessness rates and risks across countries. For instance, several countries that adopt a broader definition of homelessness report a higher incidence of homelessness, like Australia and New Zealand, relative to countries with a narrower definition, such as Chile, Portugal or Japan.

However, definitional differences do not fully explain the variation in homelessness rates across countries: several countries with a broad definition of homelessness report among the lowest incidences of homelessness, such as Norway, Poland, Finland and Denmark. Figure HC3.1 (above) accounts for these definitional differences by presenting cross-country data on homelessness for ETHOS Light categories 1, 2 and 3 only.

Different definitions of homelessness can co-exist within the same country, depending on the purpose and the collecting authority, producing considerable differences in homelessness estimates for the same territory. In the United States, for instance, the definition of homelessness used by the Department of Housing and Urban Development (HUD) – which is used to allocate federal funds to local authorities to address homelessness – is narrower than that used by the Department of Education (Evans, Phillips and Ruffini, 2019), which forms the basis of funding allocation to school districts to support children and youth experiencing homelessness. The result is two significantly different estimates of homelessness in the United States: while HUD estimated that over 580 000 people experienced homelessness on a single night in January 2022, the Department of Education reported 1.28 million children and youth nationally experienced homelessness at some point over the 2019-20 school year (this figure is exclusive of their parents) (US Interagency Council on Homelessness, 2024).

_Limitations of data collection approaches_

Beyond definitional differences, there are a number of challenges in the scope and methods of data collection that might affect measuring the full extent of homelessness (see the forthcoming OECD Monitoring Framework on Homelessness). Data on homelessness are typically based on the following collection methods, each with its strengths and limitations in terms of how well it captures different types of living situations:

- Street counts: an estimate of the number of people sleeping rough at a point-in-time;

- Service-based methods: information obtained from a broad range of service providers that support people experiencing homelessness;

- Population censuses and Household surveys: a count or a sample of a given population at a point in time (e.g. Population Census; special module on homelessness in household survey);

- Administrative data: records collected by different institutions/organisations (e.g., health data, criminal justice records, social services data, etc.) and used to extrapolate the number of people experiencing homelessness;

- Advanced sampling methods: a statistical method, such as “capture-recapture,” comparing independent samples from two or more sources of data to estimate the total number of people experiencing homelessness;

- By-name lists and Information management systems on homeless individuals: the collection of comprehensive demographic and identifying information on people experiencing homelessness, which may be collected via registry weeks.

The type of housing solution of someone experiencing homelessness – whether it is a shelter or emergency accommodation service, temporary lodging with family or friends, or living out of a car or on the street – will be better reflected in some data collection methods relative to others. Further, the scope, design and implementation of each data collection approach varies widely, which can significantly affect the quality and coverage of the data. For instance, with respect to street counts, the geographic perimeter is not systematic across (or even within) countries. In addition to counting rough sleepers on public streets, street counts may (or may not) include parks, public transport, emergency rooms, parking garages or other places that, depending on the country context, may be used by rough sleepers.

Moreover, in the case of service-based methods, there is no systematic approach to determining which types of services and emergency or temporary accommodation are included in data collection efforts, and which are left out. The selection of services to be surveyed may be narrowly defined (e.g., restricted to overnight shelters and temporary accommodation), or may be quite broad (e.g., to also include food banks, social service centres, health clinics, etc.). As a result, homelessness data resulting from service-based methods (often captured by ETHOS Light 2 and 3) are not fully comparable across countries. Table HC3.1.1 provides an overview of cross-country differences in the inclusion of children and temporary accommodation for specific groups in the national headline estimate of homelessness.

Across 40 OECD and EU countries:
- Over half (26 countries) include children under the age of 18 years;

- Around 40% (17 countries) include temporary accommodation for victims of domestic violence;

- Around 30% (12 countries) include temporary accommodation for refugees; and

- Less than a quarter (9 countries) include temporary accommodation for asylum seekers.

### Source

#### OECD – OECD Affordable Housing Database (AHD)
Retrieved on: 2024-05-24  
Retrieved from: https://www.oecd.org/housing/data/affordable-housing-database/  

#### Notes on our processing step for this indicator
We have transformed the data from homelessness per 10,000 population to homeless per 100,000 population.

We have included the years the data has been captured for each country, according to the source's notes. Whenever the data was captured over different years, we have included the latest year.


## Rate of people experiencing homelessness (ETHOS 1, 2 and 3)
Includes people living in the streets or public spaces, in emergency accommodation, and in accommodation for the homeless. This data is collected at a single point in time, generally through a coordinated street count.
Last updated: April 30, 2024  
Next update: May 2026  
Date range: 2022–2023  
Unit: people in homelessness per 100,000 population  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
OECD (2024) – with major processing by Our World in Data

#### Full citation
OECD (2024) – with major processing by Our World in Data. “Rate of people experiencing homelessness (ETHOS 1, 2 and 3)” [dataset]. OECD, “OECD Affordable Housing Database (AHD)” [original data].
Source: OECD (2024) – with major processing by Our World In Data

### What you should know about this data
* This data has been categorized within the European Typology of Homelessness and Housing Exclusion (ETHOS) typology as _ETHOS Light 1, 2 and 3_. It includes people living in the streets or public spaces, in emergency accommodation and in accommodation for the homeless, but it has not been dissagregated.
* This data is collected with a _point-in-time count_, in which data are collected at a single point in time, generally through a coordinated street count or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.
* Countries use different definitions and data collection methods and are harmonized to the extent possible.
* Data for Australia, Canada, France, Germany, South Korea, Norway, and the United States includes people living in unconventional dwellings (e.g. tents).
* Data for the United Kingdom only considers England and refers to the number of households experiencing homelessness per 100,000 households.
* Data for France exclude asylum seekers to facilitate cross-country comparison.
* More details about definitions, methodology and comparability issues can be found in the [OECD Population Experiencing Homelessness documentation](https://www.oecd.org/els/family/HC3-1-Population-experiencing-homelessness.pdf).
* For more information on the statistical definitions for each country, please check the [OECD's Country Notes on Homelessness data](https://www.oecd.org/social/homelessness-country-notes.htm).

### How is this data described by its producer - OECD (2024)?
_Definitions and methodology_

This indicator presents available data at national level on the number of people experiencing homelessness as reported by public authorities in OECD and EU countries. Data are drawn from the 2023 OECD Questionnaire on Affordable and Social Housing (QuASH 2023) and other available sources. Overall, homelessness data are available for 40 countries: all OECD countries except Hungary; and the following non-member countries: Croatia, Cyprus and Romania (Table HC 3.1.A1).

Comparing homeless estimates across countries is difficult, as countries do not define or count the population experiencing homelessness in the same way. There is no internationally agreed definition of homelessness. Therefore, this indicator presents a collection of available statistics on homelessness in OECD, EU and key partner countries in line with national definitions, drawing on the ETHOS Light typology to the extent feasible (see Box HC 3.1).

In general, the type of count can be differentiated between point-in-time counts and flow counts, which are defined below:

- Point-in-time count: Data are collected at a single point-in-time, generally through a coordinated street count and/or an enumeration of people staying in shelters for people experiencing homelessness on a given night. Point-in-time counts thus present a “snapshot” of homelessness at a single time and place.

- Flow count: Data are collected over a given period of time, such as the enumeration of all people who have stayed in a shelter over the course of the year. Point-in-time and flow data are not comparable, and are thus presented separately in this indicator. For additional discussion of the methodological challenges to homelessness data collection, see the section on Data and comparability issues below.

_Data and comparability issues_

_Significant methodological challenges stymy data collection on homelessness._

_Definitional differences_

As discussed above, differences in statistical definitions drive some of the variation in the reported incidence of homelessness across countries; these differences hamper international comparison and an understanding of the differences in homelessness rates and risks across countries. For instance, several countries that adopt a broader definition of homelessness report a higher incidence of homelessness, like Australia and New Zealand, relative to countries with a narrower definition, such as Chile, Portugal or Japan.

However, definitional differences do not fully explain the variation in homelessness rates across countries: several countries with a broad definition of homelessness report among the lowest incidences of homelessness, such as Norway, Poland, Finland and Denmark. Figure HC3.1 (above) accounts for these definitional differences by presenting cross-country data on homelessness for ETHOS Light categories 1, 2 and 3 only.

Different definitions of homelessness can co-exist within the same country, depending on the purpose and the collecting authority, producing considerable differences in homelessness estimates for the same territory. In the United States, for instance, the definition of homelessness used by the Department of Housing and Urban Development (HUD) – which is used to allocate federal funds to local authorities to address homelessness – is narrower than that used by the Department of Education (Evans, Phillips and Ruffini, 2019), which forms the basis of funding allocation to school districts to support children and youth experiencing homelessness. The result is two significantly different estimates of homelessness in the United States: while HUD estimated that over 580 000 people experienced homelessness on a single night in January 2022, the Department of Education reported 1.28 million children and youth nationally experienced homelessness at some point over the 2019-20 school year (this figure is exclusive of their parents) (US Interagency Council on Homelessness, 2024).

_Limitations of data collection approaches_

Beyond definitional differences, there are a number of challenges in the scope and methods of data collection that might affect measuring the full extent of homelessness (see the forthcoming OECD Monitoring Framework on Homelessness). Data on homelessness are typically based on the following collection methods, each with its strengths and limitations in terms of how well it captures different types of living situations:

- Street counts: an estimate of the number of people sleeping rough at a point-in-time;

- Service-based methods: information obtained from a broad range of service providers that support people experiencing homelessness;

- Population censuses and Household surveys: a count or a sample of a given population at a point in time (e.g. Population Census; special module on homelessness in household survey);

- Administrative data: records collected by different institutions/organisations (e.g., health data, criminal justice records, social services data, etc.) and used to extrapolate the number of people experiencing homelessness;

- Advanced sampling methods: a statistical method, such as “capture-recapture,” comparing independent samples from two or more sources of data to estimate the total number of people experiencing homelessness;

- By-name lists and Information management systems on homeless individuals: the collection of comprehensive demographic and identifying information on people experiencing homelessness, which may be collected via registry weeks.

The type of housing solution of someone experiencing homelessness – whether it is a shelter or emergency accommodation service, temporary lodging with family or friends, or living out of a car or on the street – will be better reflected in some data collection methods relative to others. Further, the scope, design and implementation of each data collection approach varies widely, which can significantly affect the quality and coverage of the data. For instance, with respect to street counts, the geographic perimeter is not systematic across (or even within) countries. In addition to counting rough sleepers on public streets, street counts may (or may not) include parks, public transport, emergency rooms, parking garages or other places that, depending on the country context, may be used by rough sleepers.

Moreover, in the case of service-based methods, there is no systematic approach to determining which types of services and emergency or temporary accommodation are included in data collection efforts, and which are left out. The selection of services to be surveyed may be narrowly defined (e.g., restricted to overnight shelters and temporary accommodation), or may be quite broad (e.g., to also include food banks, social service centres, health clinics, etc.). As a result, homelessness data resulting from service-based methods (often captured by ETHOS Light 2 and 3) are not fully comparable across countries. Table HC3.1.1 provides an overview of cross-country differences in the inclusion of children and temporary accommodation for specific groups in the national headline estimate of homelessness.

Across 40 OECD and EU countries:
- Over half (26 countries) include children under the age of 18 years;

- Around 40% (17 countries) include temporary accommodation for victims of domestic violence;

- Around 30% (12 countries) include temporary accommodation for refugees; and

- Less than a quarter (9 countries) include temporary accommodation for asylum seekers.

### Source

#### OECD – OECD Affordable Housing Database (AHD)
Retrieved on: 2024-05-24  
Retrieved from: https://www.oecd.org/housing/data/affordable-housing-database/  

#### Notes on our processing step for this indicator
We have transformed the data from homelessness per 10,000 population to homeless per 100,000 population.

We have included the years the data has been captured for each country, according to the source's notes. Whenever the data was captured over different years, we have included the latest year.


    
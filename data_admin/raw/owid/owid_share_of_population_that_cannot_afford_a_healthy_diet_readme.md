# Share of population that cannot afford a healthy diet - Data package

This data package contains the data that powers the chart ["Share of population that cannot afford a healthy diet"](https://ourworldindata.org/explorers/food-prices?Diet=Healthy+diet&Cost+or+Affordability=Affordability&Affordability+metric=Share+that+cannot+afford&country=NGA~BGD~IND~ETH~MEX~USA~BRA~GBR) on the Our World in Data website. It was downloaded on January 23, 2026.

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


## Share of the population who cannot afford a healthy diet
Percentage of the total population unable to afford a healthy diet. A diet is considered unaffordable when the diet cost plus expenditures for basic non-food needs exceed income per capita per day.
Last updated: August 4, 2025  
Next update: August 2026  
Date range: 2017–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
FAO and World Bank (2025), using data and methods from Bai et al. (2024) – with minor processing by Our World in Data

#### Full citation
FAO and World Bank (2025), using data and methods from Bai et al. (2024) – with minor processing by Our World in Data. “Share of the population who cannot afford a healthy diet” [dataset]. Herforth et al. (2022), adapted by World Bank, “Food Prices for Nutrition 4.0” [original data].
Source: FAO and World Bank (2025), using data and methods from Bai et al. (2024) – with minor processing by Our World In Data

### What you should know about this data
* A healthy diet meets nutritional standards set by dietary guidelines, with sufficient diversity and quantity within and between food groups to achieve nutrient adequacy and protect against diet-related diseases.
* Non-food expenses are estimated by looking at how much low-income people typically spend on things like housing, clothing, and transportation.
* This amount is calculated as the average share of non-food expenditure for a low-income consumer, multiplied by the international poverty line.
* The average share of non-food expenditure is based on the spending habits of specific income groups (quintiles):
- In upper-middle-income and high-income countries, the first quintile of consumers is considered (the poorest 20% of consumers), where people spend around 54% of their income on non-food needs.
- In low-income and lower-middle-income countries, the second quintile is considered (the second lowest 20% of consumers), where people spend about 37% and 44% of their income on non-food needs, respectively.
* The international poverty lines (in [international-$](#dod:int_dollar_abbreviation) at 2017 prices) are:
- For low-income countries: $2.15/day.
- For lower-middle-income countries: $3.65/day.
- For upper-middle-income countries: $6.85/day.
- For high-income countries: $24.36/day.
* A value of zero indicates a null or a small number rounded down at the current precision level.

### Source

#### Herforth et al. (2022), adapted by World Bank – Food Prices for Nutrition
Retrieved on: 2025-08-04  
Retrieved from: https://databank.worldbank.org/source/food-prices-for-nutrition  


    
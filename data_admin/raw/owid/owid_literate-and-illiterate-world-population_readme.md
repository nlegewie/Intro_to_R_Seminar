# Literate and illiterate world population - Data package

This data package contains the data that powers the chart ["Literate and illiterate world population"](https://ourworldindata.org/grapher/literate-and-illiterate-world-population?v=1&csvType=full&useColumnShortNames=false) on the Our World in Data website.

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


## Illiterate
Share of adults who cannot read and write a short, simple statement on their everyday life.
Last updated: June 11, 2025  
Next update: June 2026  
Date range: 1475–2023  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO (1957) and other sources – with major processing by Our World in Data

#### Full citation
UNESCO (1957); UNESCO (1953); Buringh and van Zanden (2009); van Zanden, J. et al.; UNESCO Institute for Statistics (2025) – with major processing by Our World in Data. “Illiterate” [dataset]. UNESCO, “World illiteracy at mid-century”; UNESCO, “Progress of literacy in various countries”; Buringh and van Zanden, “Charting the “Rise of the West”: Manuscripts and Printed Books in Europe, A Long-Term Perspective from the Sixth through Eighteenth Centuries”; van Zanden, J. et al., “How Was Life? Global Well-being since 1820 - Education 2014”; UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO (1957), UNESCO (1953), Buringh and van Zanden (2009), van Zanden, J. et al., UNESCO Institute for Statistics (2025) – with major processing by Our World In Data

### What you should know about this data
* Literacy is a foundational skill. Children need to learn to read so that they can read to learn. When we fail to teach this foundational skill, people have fewer opportunities to lead the rich and interesting lives that a good education offers. This indicator measures the percentage of people aged 15 and older who can read and write a simple sentence about their daily life.
* Historical data shows that only a very small share of the population, a tiny elite, was able to read and write. Although literacy has increased over the last few generations, it remains an important challenge for our time to [provide this foundational skill to all](https://ourworldindata.org/better-learning).
* However, measuring literacy over time is difficult, as definitions of what it means to be “literate” have varied widely across countries and historical periods. As a result, comparisons should be made with caution.
* Our team investigated the strengths and shortcomings of the available data on literacy. Based on this work, we've combined historical and contemporary literacy rates from various sources to provide a long-term view of global literacy trends from 1451 to the present. For detailed information on where each data point comes from, you can view and download this [Google Sheet](https://docs.google.com/spreadsheets/d/16Q4CD8ktFhdKUaIb4ab7angUmTachnIKtLR4nKz4UEI/edit).
* Many developed countries have discontinued literacy tracking as rates approached universal levels by the late 20th century, making measurement less relevant for policy purposes.
* All of this data measures basic literacy — can you read simple text and write your name? It doesn't capture *functional* literacy — can you understand a job application or follow written instructions? That requires years more education and is much harder to measure historically.

### How is this data described by its producer - UNESCO (1957), UNESCO (1953), Buringh and van Zanden (2009), van Zanden, J. et al., UNESCO Institute for Statistics (2025)?
The current UNESCO standard for defining literacy is the percentage of the population aged 15 and above who can read, understand, and write a short, simple statement on their everyday life. Generally, “literacy” also encompasses “numeracy”, the ability to make simple arithmetic calculations.

### Sources

#### UNESCO – World illiteracy at mid-century
Retrieved on: 2025-06-10  
Retrieved from: https://unesdoc.unesco.org/ark:/48223/pf0000002930  

#### UNESCO – Progress of literacy in various countries
Retrieved on: 2025-06-10  
Retrieved from: https://unesdoc.unesco.org/ark:/48223/pf0000002898  

#### Buringh and van Zanden – Charting the “Rise of the West”: Manuscripts and Printed Books in Europe, A Long-Term Perspective from the Sixth through Eighteenth Centuries
Retrieved on: 2025-06-09  
Retrieved from: https://www.researchgate.net/publication/46544350_Charting_the_Rise_of_the_West_Manuscripts_and_Printed_Books_in_Europe_A_Long-Term_Perspective_from_the_Sixth_through_Eighteenth_Centuries  

#### van Zanden, J. et al. – How Was Life? Global Well-being since 1820 - Education
Retrieved on: 2023-08-14  
Retrieved from: https://www.oecd-ilibrary.org/economics/how-was-life/education-since-1820_9789264214262-9-en  

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  

#### Notes on our processing step for this indicator
- This dataset combines historical and contemporary literacy rates from various sources to provide a long-term view of global literacy trends from 1451 to the present.
- 1451–1800: Direct literacy surveys did not exist during this period. Data for Great Britain, Ireland, France, Belgium, the Netherlands, Germany, Italy, Spain, Sweden, and Poland comes from the "[Charting the Rise of the West](https://www.researchgate.net/publication/46544350_Charting_the_Rise_of_the_West_Manuscripts_and_Printed_Books_in_Europe_A_Long-Term_Perspective_from_the_Sixth_through_Eighteenth_Centuries)" study. The authors estimated literacy rates using manuscript and book production as indirect indicators. While more books likely indicated more readers, this approach has clear limitations.
- 1820–1970 (Global estimates): Estimates for worldwide literacy are drawn from the OECD's “[How Was Life? Global Wellbeing Since 1820](https://www.oecd.org/en/publications/how-was-life_9789264214262-en.html)” report, which compiled a global long-run estimate of literacy using available historical records. A key limitation is that early literacy measures often accepted minimal skills — such as the ability to sign marriage documents — which fall short of contemporary literacy standards involving actual reading and writing proficiency.
- 1900–1950: UNESCO's “[Progress of literacy in various countries](https://unesdoc.unesco.org/ark:/48223/pf0000002898)” gathered data from 26 countries, revealing substantial variation in definitions. Some countries required only reading or writing skills, others demanded both, and some accepted signature ability as sufficient proof. Age thresholds also varied widely, ranging from 5 to 15 years.
- 1950: UNESCO's “[World Illiteracy at Mid-Century](https://unesdoc.unesco.org/ark:/48223/pf0000002930)” marked a significant milestone as the first comprehensive global literacy assessment. Data primarily came from censuses conducted between 1945 and 1954 for populations aged 15 and older. Where census data was unavailable, researchers generated estimates using historical trends and country-specific factors. Given the uncertainty, literacy rates were reported in 5% intervals. This data is reported as a range (e.g., 10–20%). These ranges were converted into single-point estimates by taking their midpoint to allow for consistent analysis. For example, 10–20% was recoded as 15%.
- 1970–present: Contemporary data comes from the [UNESCO Institute for Statistics](https://databrowser.uis.unesco.org/resources/bulk), based on population censuses or household surveys, and is often self-reported. A person is considered literate if they can read and write a short, simple sentence about everyday life. Many countries also include basic numeracy in this definition. Rates are shown as the percentage of the population aged 15 and above who meet this threshold.
- When only the illiteracy rate was reported, the literacy rate was calculated by subtracting it from 100%.


## Literate
Share of adults who can read and write a simple statement about their everyday life.
Last updated: June 11, 2025  
Next update: June 2026  
Date range: 1475–2023  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
UNESCO (1957) and other sources – with major processing by Our World in Data

#### Full citation
UNESCO (1957); UNESCO (1953); Buringh and van Zanden (2009); van Zanden, J. et al.; UNESCO Institute for Statistics (2025) – with major processing by Our World in Data. “Literate” [dataset]. UNESCO, “World illiteracy at mid-century”; UNESCO, “Progress of literacy in various countries”; Buringh and van Zanden, “Charting the “Rise of the West”: Manuscripts and Printed Books in Europe, A Long-Term Perspective from the Sixth through Eighteenth Centuries”; van Zanden, J. et al., “How Was Life? Global Well-being since 1820 - Education 2014”; UNESCO Institute for Statistics, “UNESCO Institute for Statistics (UIS) - Education” [original data].
Source: UNESCO (1957), UNESCO (1953), Buringh and van Zanden (2009), van Zanden, J. et al., UNESCO Institute for Statistics (2025) – with major processing by Our World In Data

### What you should know about this data
* Literacy is a foundational skill. Children need to learn to read so that they can read to learn. When we fail to teach this foundational skill, people have fewer opportunities to lead the rich and interesting lives that a good education offers. This indicator measures the percentage of people aged 15 and older who can read and write a simple sentence about their daily life.
* Historical data shows that only a very small share of the population, a tiny elite, was able to read and write. Although literacy has increased over the last few generations, it remains an important challenge for our time to [provide this foundational skill to all](https://ourworldindata.org/better-learning).
* However, measuring literacy over time is difficult, as definitions of what it means to be “literate” have varied widely across countries and historical periods. As a result, comparisons should be made with caution.
* Our team investigated the strengths and shortcomings of the available data on literacy. Based on this work, we've combined historical and contemporary literacy rates from various sources to provide a long-term view of global literacy trends from 1451 to the present. For detailed information on where each data point comes from, you can view and download this [Google Sheet](https://docs.google.com/spreadsheets/d/16Q4CD8ktFhdKUaIb4ab7angUmTachnIKtLR4nKz4UEI/edit).
* Many developed countries have discontinued literacy tracking as rates approached universal levels by the late 20th century, making measurement less relevant for policy purposes.
* All of this data measures basic literacy — can you read simple text and write your name? It doesn't capture *functional* literacy — can you understand a job application or follow written instructions? That requires years more education and is much harder to measure historically.

### How is this data described by its producer - UNESCO (1957), UNESCO (1953), Buringh and van Zanden (2009), van Zanden, J. et al., UNESCO Institute for Statistics (2025)?
The current UNESCO standard for defining literacy is the percentage of the population aged 15 and above who can read, understand, and write a short, simple statement on their everyday life. Generally, “literacy” also encompasses “numeracy”, the ability to make simple arithmetic calculations.

### Sources

#### UNESCO – World illiteracy at mid-century
Retrieved on: 2025-06-10  
Retrieved from: https://unesdoc.unesco.org/ark:/48223/pf0000002930  

#### UNESCO – Progress of literacy in various countries
Retrieved on: 2025-06-10  
Retrieved from: https://unesdoc.unesco.org/ark:/48223/pf0000002898  

#### Buringh and van Zanden – Charting the “Rise of the West”: Manuscripts and Printed Books in Europe, A Long-Term Perspective from the Sixth through Eighteenth Centuries
Retrieved on: 2025-06-09  
Retrieved from: https://www.researchgate.net/publication/46544350_Charting_the_Rise_of_the_West_Manuscripts_and_Printed_Books_in_Europe_A_Long-Term_Perspective_from_the_Sixth_through_Eighteenth_Centuries  

#### van Zanden, J. et al. – How Was Life? Global Well-being since 1820 - Education
Retrieved on: 2023-08-14  
Retrieved from: https://www.oecd-ilibrary.org/economics/how-was-life/education-since-1820_9789264214262-9-en  

#### UNESCO Institute for Statistics – UNESCO Institute for Statistics (UIS) - Education
Retrieved on: 2025-05-01  
Retrieved from: https://databrowser.uis.unesco.org/resources/bulk  

#### Notes on our processing step for this indicator
- This dataset combines historical and contemporary literacy rates from various sources to provide a long-term view of global literacy trends from 1451 to the present.
- 1451–1800: Direct literacy surveys did not exist during this period. Data for Great Britain, Ireland, France, Belgium, the Netherlands, Germany, Italy, Spain, Sweden, and Poland comes from the "[Charting the Rise of the West](https://www.researchgate.net/publication/46544350_Charting_the_Rise_of_the_West_Manuscripts_and_Printed_Books_in_Europe_A_Long-Term_Perspective_from_the_Sixth_through_Eighteenth_Centuries)" study. The authors estimated literacy rates using manuscript and book production as indirect indicators. While more books likely indicated more readers, this approach has clear limitations.
- 1820–1970 (Global estimates): Estimates for worldwide literacy are drawn from the OECD's “[How Was Life? Global Wellbeing Since 1820](https://www.oecd.org/en/publications/how-was-life_9789264214262-en.html)” report, which compiled a global long-run estimate of literacy using available historical records. A key limitation is that early literacy measures often accepted minimal skills — such as the ability to sign marriage documents — which fall short of contemporary literacy standards involving actual reading and writing proficiency.
- 1900–1950: UNESCO's “[Progress of literacy in various countries](https://unesdoc.unesco.org/ark:/48223/pf0000002898)” gathered data from 26 countries, revealing substantial variation in definitions. Some countries required only reading or writing skills, others demanded both, and some accepted signature ability as sufficient proof. Age thresholds also varied widely, ranging from 5 to 15 years.
- 1950: UNESCO's “[World Illiteracy at Mid-Century](https://unesdoc.unesco.org/ark:/48223/pf0000002930)” marked a significant milestone as the first comprehensive global literacy assessment. Data primarily came from censuses conducted between 1945 and 1954 for populations aged 15 and older. Where census data was unavailable, researchers generated estimates using historical trends and country-specific factors. Given the uncertainty, literacy rates were reported in 5% intervals. This data is reported as a range (e.g., 10–20%). These ranges were converted into single-point estimates by taking their midpoint to allow for consistent analysis. For example, 10–20% was recoded as 15%.
- 1970–present: Contemporary data comes from the [UNESCO Institute for Statistics](https://databrowser.uis.unesco.org/resources/bulk), based on population censuses or household surveys, and is often self-reported. A person is considered literate if they can read and write a short, simple sentence about everyday life. Many countries also include basic numeracy in this definition. Rates are shown as the percentage of the population aged 15 and above who meet this threshold.
- When only the illiteracy rate was reported, the literacy rate was calculated by subtracting it from 100%.


    
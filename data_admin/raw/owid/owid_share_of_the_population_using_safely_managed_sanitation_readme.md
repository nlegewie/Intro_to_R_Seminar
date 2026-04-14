# Share of the population using safely managed sanitation - Data package

This data package contains the data that powers the chart ["Share of the population using safely managed sanitation"](https://ourworldindata.org/explorers/water-and-sanitation?Resource=Sanitation&Level+of+Use%2FAccess=Safely+managed&Residence=Total&Relative+to+population=Share+of+population&country=IND~USA~KEN~OWID_WRL~BGD~ZAF~CHN) on the Our World in Data website. It was downloaded on January 25, 2026.

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


## Usage of safely managed sanitation services
Proportion of people using [improved sanitation facilities](#dod:improved-sanitation) that are not shared with other households and where excreta are safely disposed in situ or transported and treated off-site.
Last updated: December 8, 2025  
Next update: December 2027  
Date range: 2000–2024  
Unit: %  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (2025) – processed by Our World in Data

#### Full citation
WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (2025) – processed by Our World in Data. “Usage of safely managed sanitation services” [dataset]. World Health Organization/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene, “WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (JMP) 2000-2024 report” [original data].
Source: WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (2025) – processed by Our World In Data

### What you should know about this data
* Having access to safe and comfortable sanitation facilities is essential to a healthy and dignified life. Improved sanitation facilities help prevent the spread of diseases such as cholera, dysentery, and typhoid by providing safe separation from human waste.
* Safely managed sanitation services are defined as improved sanitation facilities that are not shared with other households and where excreta are safely disposed in situ or transported and treated off-site.
* This is the highest level of sanitation service and indicates reliable access to safe sanitation facilities.
* This data is provided by the WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (JMP). They compile data from nationally representative household surveys and censuses, administrative data and service provider data. To learn more, see the [JMP Methodology](https://washdata.org/topics/methods/data-sources).
* This data reflects actual service use, which is directly linked to health outcomes and can be consistently measured across countries using household surveys. It is possible to theoretically have access to some kind of water and sanitation infrastructure, but not use them for daily needs. Therefore we refer to "use" or "using" rather than "access" to better reflect the underlying data.

### How is this data described by its producer - WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (2025)?
Use of safely managed sanitation services.

### Additional information about this data
Safely managed sanitation is improved facilities which are not shared with other households and where excreta are safely disposed in situ or transported and treated off-site.
Improved sanitation facilities are designed to hygienically separate excreta from human contact. They include flush to piped sewer system, septic tanks or pit latrines; ventilated improved pit latrines, composting toilets or pit latrines with slabs.

### Source

#### World Health Organization/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene – WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation and Hygiene (JMP)
Retrieved on: 2025-12-08  
Retrieved from: https://washdata.org/data/downloads#WLD  


    
# Emissions of air pollutants from all sectors - Data package

This data package contains the data that powers the chart ["Emissions of air pollutants from all sectors"](https://ourworldindata.org/explorers/air-pollution?Pollutant=All+pollutants&Sector=All+sectors+%28total%29&Per+capita=false&country=CHN~IND~GBR~USA~OWID_WRL) on the Our World in Data website.

## CSV Structure

The high level structure of the CSV file is that each row is an observation for an entity (usually a country or region) and a timepoint (usually a year).

The first two columns in the CSV file are "Entity" and "Code". "Entity" is the name of the entity (e.g. "United States"). "Code" is the OWID internal entity code that we use if the entity is a country or region. For normal countries, this is the same as the [iso alpha-3](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-3) code of the entity (e.g. "USA") - for non-standard countries like historical countries these are custom codes.

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


## Ammonia emissions from all sectors
Ammonia (NH₃) is a gas which can mix with other gases – such as nitrogen oxides and sulfur dioxide – to form particulate matter. Its main sources are the use of manure and fertilizers in agriculture, and emissions from industry.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Ammonia emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Black carbon emissions from all sectors
Black carbon (BC) is a soot-like pollutant formed from the burning of biomass and fossil fuels. It is a major contributor to particulate matter pollution, and contributes to climate change by absorbing sunlight.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Black carbon emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Carbon monoxide emissions from all sectors
Carbon monoxide (CO) is a pollutant produced from the incomplete combustion of carbon-based fuels such as oil, gas, wood, and coal. CO is a harmful gas that contributes to both outdoor and indoor air pollution.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Carbon monoxide emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Methane emissions from all sectors
Methane (CH₄) is a greenhouse gas that contributes to the formation of ground-level ozone, a harmful air pollutant. Key sources of methane include agriculture, landfills, and fossil fuel extraction.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1970–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Methane emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Nitrogen oxides emissions from all sectors
Nitrogen oxides (NOₓ) are gases that are mainly formed during the burning of fossil fuels. Exposure to NOₓ gases can have negative impacts on respiratory health. NOₓ gases can also lead to the formation of ozone – another air pollutant.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Nitrogen oxides emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Nitrous oxide emissions from all sectors
Nitrous oxide (N₂O) is a greenhouse gas that contributes to air pollution by depleting the stratospheric ozone layer and influencing atmospheric chemistry. Major sources include agriculture, industrial processes, and fossil fuel combustion.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1970–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Nitrous oxide emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Non-methane volatile organic compounds emissions from all sectors
Non-methane volatile organic compounds (NMVOCs) are pollutants formed from the burning of biomass and fossil fuels. NMVOCs can lead to the formation of other local air pollutants, such as ozone.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Non-methane volatile organic compounds emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Organic carbon emissions from all sectors
Organic carbon molecules are formed from the incomplete burning of organic materials, including fossil fuels and biomass. They can also be suspended in the air from sources such as vehicle tyres and roads. Organic carbon adds to particulate matter pollution, with negative impacts on human health.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Organic carbon emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


## Sulfur dioxide emissions from all sectors
Sulfur dioxide (SO₂) is an air pollutant formed from the burning of fuels that contain sulfur, such as coal. SO₂ is one of the main chemicals that forms acid rain.
Last updated: February 12, 2025  
Next update: February 2026  
Date range: 1750–2022  
Unit: tonnes  


### How to cite this data

#### In-line citation
If you have limited space (e.g. in data visualizations), you can use this abbreviated in-line citation:  
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data

#### Full citation
Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World in Data. “Sulfur dioxide emissions from all sectors” [dataset]. Hoesly et al., “Community Emissions Data System v_2024_07_08” [original data].
Source: Hoesly et al. (2024) - Community Emissions Data System (CEDS) – with major processing by Our World In Data

### What you should know about this data
* "Agriculture" includes air pollutant emissions from biological processes such as manure management, rice cultivation, soil processes, and livestock digestive processes. It also covers indirect N₂O emissions from non-agricultural nitrogen sources and fuel combustion in agricultural machinery, forestry, and fishing.
* "Buildings" includes air pollutant emissions from fuel combustion in residential, commercial, and institutional buildings. Key sources include heating, cooking, and other energy use in homes, offices, and public facilities.
* "Domestic aviation" includes air pollutant emissions from fuel combustion in aircraft operating on domestic routes.
* "Energy" includes air pollutant emissions from fuel combustion in electricity and heat production, as well as fugitive emissions from solid fuels, petroleum, and natural gas extraction. This sector also includes emissions from fossil fuel fires.
* "Industry" includes air pollutant emissions from fuel combustion and chemical processes in manufacturing sectors, such as iron and steel production, cement and lime manufacturing, mining, and non-metallic mineral processing.
* "International aviation" includes air pollutant emissions from fuel combustion in aircraft operating on international routes.
* "International shipping" includes air pollutant emissions from fuel combustion in ships engaged in international transport. It also covers emissions from oil tanker loading, the transfer of crude oil or petroleum products between storage facilities and transport systems such as tankers.
* "Transport" includes air pollutant emissions from fuel combustion in road, rail, and domestic navigation.
* "Solvents" includes air pollutant emissions from industrial and consumer applications such as degreasing, painting, and chemical manufacturing.
* "Waste" includes air pollutant emissions from solid waste disposal, waste combustion, wastewater handling, and other waste management processes.
* Emissions assigned to "Other" are those that are included in the global total, but cannot be allocated to any specific countries.

### Source

#### Hoesly et al. – Community Emissions Data System
Retrieved on: 2025-02-12  
Retrieved from: https://zenodo.org/records/12803197  

#### Notes on our processing step for this indicator
Subsectors have been mapped into broader sectors as follows (using CEDS codes):
* Agriculture: enteric fermentation (3E); fuel use in agriculture, forestry, and fishing (1A4c); indirect N₂O emissions (non-agricultural sources) (7BC); manure management (3B); other agricultural emissions (3I); rice cultivation (3D); soil emissions (3D).
* Buildings: commercial and institutional buildings (1A4a); residential buildings (1A4b).
* Domestic aviation: domestic aviation (1A3aii).
* Energy: electricity production (autoproducer) (1A1a); electricity production (public) (1A1a); fossil fuel fires (7A); fugitive emissions from natural gas distribution (1B2b); fugitive emissions from natural gas production (1B2b); fugitive emissions from other energy sources (1B2d); fugitive emissions from petroleum (1B2); fugitive emissions from solid fuels (1B1); heat production (1A1a); other energy transformation (1A1bc); other fuel use (unspecified) (1A5).
* Industry: adipic acid production (2B3); aluminum production (2C3); cement production (2A1); chemical industry (2B); industrial combustion (chemicals) (1A2c); industrial combustion (construction) (1A2g); industrial combustion (food and tobacco) (1A2e); industrial combustion (iron and steel) (1A2a); industrial combustion (machinery) (1A2g); industrial combustion (mining and quarrying) (1A2g); industrial combustion (non-ferrous metals) (1A2b); industrial combustion (non-metallic minerals) (1A2f); industrial combustion (other) (1A2g); industrial combustion (pulp and paper) (1A2d); industrial combustion (textile and leather) (1A2g); industrial combustion (transport equipment) (1A2g); industrial combustion (wood products) (1A2g); iron and steel alloy production (2C1); lime production (2A2); nitric acid production (2B2); other mineral production (2Ax); other non-ferrous metal production (2C4); pulp and paper, food, beverage, and wood processing (2H).
* International aviation: international aviation (1A3ai).
* International shipping: international shipping (1A3di); oil tanker loading (1A3di).
* Solvents: chemical products manufacture and processing (2D); degreasing and cleaning (2D); other product use (2D); paint application (2D).
* Transport: domestic navigation (1A3dii); other transport (1A3eii); rail transportation (1A3c); road transportation (1A3b).
* Waste: other waste handling (5E); other waste sources (6A); solid waste disposal (5A); unspecified waste sources (6B); waste combustion (5C); wastewater handling (5D).


    
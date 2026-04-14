



###**************************** ###
###**************************** ###
##### ***OWID DATA SET GENERATION*** #####
###**************************** ###
###**************************** ###



###****************************** ###
##### ***SET UP WORK SPACE *** #####
###****************************** ###

###************** ###
##### PACKAGES #####
###************** ###

library(tidyverse)
library(here)


###************** ###
##### PATHS #####
###************** ###


owid_path <- here("data_admin", "raw", "owid")

grid_path <- here("data_admin", "raw", "grid")

ai_path <- here("data_admin", "raw", "ai")

processed_path <- here("data_admin", "processed")



###************** ###
##### INPUT NAMES #####
###************** ###

###************** ###
##### OWID #####
###************** ###

owid_input_names <- c(
    "owid_population.csv",
    "owid_child_mortality_rate.csv",
    "owid_co2_data.csv",
    "owid_democracy.csv",
    "owid_gdp.csv",
    "owid_life_expectancy.csv",
    "owid_plastic_waste_generation.csv",
    "owid_poverty_dataset.csv",
    "owid_total_healthcare_spending_as_a_share_of_gdp.csv",
    "owid_total_number_of_emigrants.csv",
    "owid_total_number_of_international_immigrants.csv",
"owid_deaths_in_armed_conflicts_based_on_where_they_occurred.csv",
"owid_share_of_the_population_using_safely_managed_drinking_water.csv",
"owid_number_of_maternal_deaths.csv",
"owid_plastic_waste_exports.csv",
"owid_share_of_population_that_cannot_afford_a_healthy_diet.csv",
"owid_learning_adjusted_years_of_schooling_among_children.csv",
"owid_gender_gap_education_levels.csv",
"owid_primary_secondary_enrollment_completion_rates.csv",
"owid_literate_and_illiterate_world_population.csv",
"owid_self_reported_trust_attitudes.csv",
"owid_one_person_households.csv",
"owid_number_of_internet_users.csv",
"owid_homelessness_rate.csv",
"owid_genuine_savings.csv",
"owid_female_labor_participation.csv",
"owid_bribery_prevalence.csv",
"owid_annual_working_hours.csv",
"owid_edu_spending_gdp_vs_total_spending.csv",
"owid_land_animals_slaughtered_for_meat.csv",
"owid_death_rate_from_suicides.csv",
"owid_female_homicide_rate.csv",
"owid_time_use.csv"
)


###************** ###
##### GRID #####
###************** ###

grid_input_name <- "Stats_20250517065105.csv"


###************** ###
##### AI data #####
###************** ###

ai_input_names <- c(
    "ai_companies_investment.csv",
    "ai_companies_patents.csv",
    "ai_private_sector.csv"
)



###************** ###
##### READ IN DATA #####
###************** ###

###************** ###
##### OWID data #####
###************** ###

##### Get Country-Code df #####

country_code_df <- read_csv(here(owid_path, owid_input_names[2])) %>%
    rename(country = 1, code = 2) %>%
    select(1:2) %>%
    distinct()


##### Read in data #####

# TODO: add natural resources data?


owid_data_population <- read_csv(here(owid_path, owid_input_names[1])) %>%
    rename(population = 4) %>%
    select(-Code)

owid_data_child_mortality <- read_csv(here(owid_path, owid_input_names[2])) %>%
    rename(child_mortality_rate = 4) %>%
    select(-Code)

owid_data_co2 <- read_csv(here(owid_path, owid_input_names[3])) %>%
    select(country, year, co2:co2_growth_prct, co2_per_capita, co2_per_gdp, cumulative_co2, energy_per_capita, primary_energy_consumption, share_global_co2, total_ghg)

owid_data_democracy <- read_csv(here(owid_path, owid_input_names[4])) %>%
    rename(democracy_score = 4) %>%
    select(-Code) %>%
    mutate(democracy_score_string = case_when(democracy_score == 0 ~ "closed autocracy", democracy_score == 1 ~ "electoral autocracy", democracy_score == 2 ~ "electoral democracy", democracy_score == 3 ~ "liberal democracy"))

owid_data_gdp <- read_csv(here(owid_path, owid_input_names[5])) %>%
    rename(gdp = 4) %>%
    select(-Code, -5)

owid_data_life_expectancy <- read_csv(here(owid_path, owid_input_names[6])) %>%
    rename(life_expectancy_birth = 4) %>%
    select(-Code)

owid_data_plastic_waste_generation <- read_csv(here(owid_path, owid_input_names[7])) %>%
    rename(plastic_waste_generation = 4) %>%
    select(-Code)

owid_data_poverty_dataset <- read_csv(here(owid_path, owid_input_names[8])) %>%
    filter(reporting_level == "national") %>%
    select(country, year, headcount_ratio_international_povline, headcount_ratio_upper_mid_income_povline,headcount_ratio_4000, headcount_ratio_50_median, total_shortfall_international_povline, poverty_gap_index_international_povline, mean, median, gini, polarization, s80_s20_ratio)

owid_data_healthcare_spending <- read_csv(here(owid_path, owid_input_names[9])) %>%
    rename(healthcare_spending_share_of_gdp = 4) %>%
    select(-Code)

owid_data_emigrants <- read_csv(here(owid_path, owid_input_names[10])) %>%
    rename(total_emigrants = 4) %>%
    select(-Code)

owid_data_immigrants <- read_csv(here(owid_path, owid_input_names[11])) %>%
    rename(total_immigrants = 4) %>%
    select(-Code)

owid_data_deaths_in_armed_conflicts <- read_csv(here(owid_path, owid_input_names[12])) %>%
    rename(deaths_in_armed_conflicts = 4) %>%
    select(-Code) %>%
    filter(!(Entity %in% c("Abkhazia", "Abyei")))

owid_data_access_to_water <- read_csv(here(owid_path, owid_input_names[13])) %>%
    rename(access_to_water = 4) %>%
    select(-Code)

owid_data_maternal_deaths <- read_csv(here(owid_path, owid_input_names[14])) %>%
    rename(maternal_deaths = 4) %>%
    select(-Code, -5)

owid_data_plastic_waste_exports <- read_csv(here(owid_path, owid_input_names[15])) %>%
    rename(plastic_waste_exports = 4) %>%
    select(-Code)

owid_data_healthy_diet <- read_csv(here(owid_path, owid_input_names[16])) %>%
    rename(healthy_diet = 4) %>%
    select(-Code)

owid_data_learning_adjusted_years_of_schooling <- read_csv(here(owid_path, owid_input_names[17])) %>%
    rename(years_of_schooling = 4) %>%
    select(-Code)

owid_data_gender_gap_education_levels <- read_csv(here(owid_path, owid_input_names[18])) %>%
    rename(girls_in_tertiary = 4,
           boys_in_tertiary = 5,
           girls_in_primary = 6,
           boys_in_primary = 7) %>%
    select(Entity, Year, girls_in_tertiary:boys_in_primary)

owid_data_enrollment_rates <- read_csv(here(owid_path, owid_input_names[19])) %>%
    rename(
        primary_enrollment_rate = 4,
        secondary_enrollment_rate = 5,
        tertiary_enrollment_rate = 6
    ) %>%
    select(Entity, Year, primary_enrollment_rate:tertiary_enrollment_rate)


owid_data_literacy <- read_csv(here(owid_path, owid_input_names[20])) %>%
    rename(illiterate_rate = 4) %>%
    select(Entity, Year, illiterate_rate)

owid_data_trust_attitudes <- read_csv(here(owid_path, owid_input_names[21])) %>%
    rename(trust_attitudes = 4) %>%
    select(Entity, Year, trust_attitudes)


owid_data_one_person_households <- read_csv(here(owid_path, owid_input_names[22])) %>%
    rename(one_person_households = 4) %>%
    select(-Code)

owid_data_number_of_internet_users <- read_csv(here(owid_path, owid_input_names[23])) %>%
    rename(number_of_internet_users = 4) %>%
    select(-Code)

owid_data_homelessness_rate <- read_csv(here(owid_path, owid_input_names[24])) %>%
    rename(living_streets_or_public_spaces = 4,
staying_temporary_acc_shelter = 5, unhoused_either = 6) %>%
    select(-Code)

owid_data_genuine_savings <- read_csv(here(owid_path, owid_input_names[25])) %>%
    rename(genuine_savings = 4) %>%
    select(-Code)

owid_data_female_labor_participation <- read_csv(here(owid_path, owid_input_names[26])) %>%
    rename(female_labor_participation = 4) %>%
    select(-Code)

owid_data_bribery_prevalence <- read_csv(here(owid_path, owid_input_names[27])) %>%
    rename(bribery_prevalence = 4,
           world_region = 5) %>%
    select(-Code)

owid_data_annual_working_hours <- read_csv(here(owid_path, owid_input_names[28])) %>%
    rename(annual_working_hours = 4) %>%
    select(-Code)

owid_data_edu_spending_gdp_vs_total_spending <- read_csv(here(owid_path, owid_input_names[29])) %>%
    rename(edu_spending_total_spending = 4, edu_spending_gdp = 5) %>%
    select(-Code)

owid_data_land_animals_slaughtered_for_meat <- read_csv(here(owid_path, owid_input_names[30])) %>%
    rename(land_animals_slaughtered_for_meat = 4) %>%
    select(-Code)

owid_data_death_rate_from_suicides <- read_csv(here(owid_path, owid_input_names[31])) %>%
    rename(suicide_rate = 4) %>%
    select(-Code)

owid_data_female_homicide_rate <- read_csv(here(owid_path, owid_input_names[32])) %>%
    rename(female_homicide_rate = 4) %>%
    select(-Code)

owid_data_time_use <- read_csv(here(owid_path, owid_input_names[33])) %>%
    mutate(year = 2013) %>%
    rename(time_use = 3) %>%
    pivot_wider(names_from = Category, values_from = time_use) %>%
    rename(time_use_paid_work = 3, time_use_education = 4, time_use_care = 5, time_use_housework = 6, time_use_shopping = 7, time_use_volunteering = 8, time_use_sleep = 9, time_use_eating_drinking = 10, time_use_personal_care = 11, time_use_sports = 12, time_use_events = 13, time_use_friends = 14, time_use_tv_radio = 15, time_use_other = 16) %>%
    select(country = Country, year, everything())


##### Rename join variables #####

owid_data_list <-
    ls(pattern = "^owid_data_") %>%
    discard(~ .x %in% c("owid_data_list", "owid_data")) %>%
    set_names() %>%
    map(~ get(.x, envir = .GlobalEnv)) %>%
    keep(~ inherits(.x, "data.frame")) %>%
    map(
        ~ .x %>%
            rename(country = 1, year = 2)
    )

iwalk(owid_data_list, ~ assign(.y, .x, envir = .GlobalEnv))


##### Join data #####

owid_data <- owid_data_list %>%
    reduce(full_join, by = c("country", "year")) %>%
    rename(
        mean_income = mean,
        median_income = median,
        polarization_income = polarization
    )


###************** ###
##### GRID data #####
###************** ###

grid_data <- read_csv(here(grid_path, grid_input_name)) %>%
    select(country, year, gender, age, share_top5_pct_inc:share_top0_01_pct_inc) %>%
    rename(code = country) %>%
    left_join(country_code_df, by = "code") %>%
    select(-code) %>%
    select(country, year:share_top0_01_pct_inc)


###************** ###
##### AI data #####
###************** ###

##### Read in #####

ai_investment_data <- read_csv(here(ai_path, ai_input_names[1])) %>%
    filter(field == "All") %>%
    select(-field)

ai_patents_data <- read_csv(here(ai_path, ai_input_names[2])) %>%
    filter(field == "All") %>%
    select(-field)

ai_private_sector_data <- read_csv(here(ai_path, ai_input_names[3])) %>%
    count(Country) %>%
    filter(!is.na(Country)) %>%
    rename(n_companies = n, country = Country)


##### Join #####

ai_data <- ai_investment_data %>%
    left_join(ai_patents_data) %>%
    left_join(ai_private_sector_data)


###************** ###
##### ***ORDER OWID DATA *** #####
###************** ###

# owid_data_ordered <- owid_data %>%
#     arrange(country, year) %>%
#     select(
#         country, world_region, year, population, gdp, genuine_savings, headcount_ratio_international_povline:s80_s20_ratio, staying_temporary_acc_shelter, living_streets_or_public_spaces, unhoused_either, child_mortality_rate, co2:total_ghg, democracy_score, democracy_score_string, total_emigrants, healthcare_spending_share_of_gdp, total_immigrants, life_expectancy_birth, plastic_waste_generation, deaths_in_armed_conflicts, access_to_water, maternal_deaths, plastic_waste_exports, number_of_internet_users, healthy_diet, years_of_schooling, girls_in_tertiary:boys_in_primary, , edu_spending_total_spending:illiterate_rate, trust_attitudes, one_person_households, suicide_rate, female_homicide_rate,
#         female_labor_participation, bribery_prevalence,  annual_working_hours,  land_animals_slaughtered_for_meat
#     )


#####************** ###
##### ***OUTPUT DATA*** #####
###************** ###

write_csv(owid_data, here(processed_path, "owid_data.csv"))
write_csv(grid_data, here(processed_path, "processed", "grid_data.csv"))
write_csv(ai_data, here(processed_path, "processed", "ai_data.csv"))

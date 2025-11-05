

#Load packages
library(tidyverse)
library(here)
library(gtsummary)

#Set project root
here::i_am("code/code_analysis.R")

#Load data
data_path <- here::here("data", "brfss_obesity.csv")
df <- read_csv(data_path)

#Filter Georgia data
ga_data <- df %>%
  filter(LocationDesc == "Georgia")

#Table 1: Summary of Obesity by Race
ga_race <- ga_data %>%
  filter(Class == "Obesity / Weight Status",
         StratificationCategory1 == "Race/Ethnicity")

table1_gt <- ga_race %>%
  gtsummary::tbl_summary(
    by = Stratification1,
    include = c(Sample_Size, Data_Value, Data_Value_Alt,
                High_Confidence_Limit, Low_Confidence_Limit),
    statistic = all_continuous() ~ "{mean} ({sd})",
    missing = "no"
  ) %>%
  gtsummary::bold_labels()

#Save Table 1
table1 <- as_gt(table1_gt)

saveRDS(
  table1,
  file = here::here("output", "table1.rds")
)


#Figure 1: Bar chart of average obesity prevalence
figure1 <- ga_race %>%
  group_by(Stratification1) %>%
  summarise(mean_value = mean(Data_Value, na.rm = TRUE)) %>%
  ggplot(aes(x = Stratification1, y = mean_value, fill = Stratification1)) +
  geom_col() +
  labs(
    title = "Obesity Prevalence in Georgia by Race/Ethnicity (2011)",
    x = "Race/Ethnicity",
    y = "Average Obesity Prevalence (%)"
  ) +
  theme_minimal(base_size = 14) +
  theme(legend.position = "none",
        axis.text.x = element_text(angle = 45, hjust = 1))

#Save Figure 1
saveRDS(
  figure1,
  file = here::here("output", "figure1.rds")
)


library(readr)
library(dplyr)
library(ggplot2)
#------------------

# 1. Data Cleaning 

df <- read_csv("LAB2 R /Dairy.csv")

df <- df %>%
  rename(
    dairy_distribution = `Dairy distribution`,
    reference_period   = `Reference period`,
    kilolitres         = Kilolitres
  ) %>%
  mutate(
    # remove commas and make numeric
    kilolitres = as.numeric(gsub(",", "", kilolitres)),
    # turn "January 2000" into a Date (first day of month)
    date = as.Date(paste0("01 ", reference_period), format = "%d %B %Y"),
    year = as.integer(format(date, "%Y")),
    month = format(date, "%B"),
    month_num = as.integer(format(date, "%m"))
  ) %>%
  filter(!is.na(dairy_distribution), !is.na(date), !is.na(kilolitres))

#-----------------------
# 2. Summary Statistics 
  
summary_stats <- df %>%
  group_by(dairy_distribution) %>%
  summarise(
    mean = mean(kilolitres),
    median = median(kilolitres),
    sd = sd(kilolitres),
    min = min(kilolitres),
    max = max(kilolitres),
    .groups = "drop"
   )
print(summary_stats)

#-------------------------------

# 3. Seasonality ( Average by Month across years)

monthly_avg <- df %>%
  group_by(dairy_distribution, month_num, month) %>%
  summarise(avg_kilolitres = mean(kilolitres), .groups = "drop") %>%
  arrange(dairy_distribution, month_num)

# Plot: Seasonality
ggplot(monthly_avg, aes(x = factor(month, levels = unique(month[order(month_num)])),
                        y = avg_kilolitres, color = dairy_distribution, group = dairy_distribution)) +
  geom_line() +
  geom_point() +
  labs(title = "Average Monthly Dairy Distribution",
       x = "Month", y = "Average Kilolitres", color = "Category") +
  scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
  theme_minimal()

#----------------------------------------------

# 4. Yearly Totals (per category)

yearly_totals <- df %>%
  group_by(dairy_distribution, year) %>%
  summarise(total_kilolitres = sum(kilolitres), .groups = "drop")

# Plot: Yearly Totals
ggplot(yearly_totals, aes(x = year, y = total_kilolitres, fill = dairy_distribution)) +
  geom_col(position = position_dodge()) +
  labs(title = "Yearly Dairy Distribution Totals",
       x = "Year", y = "Total Kilolitres", fill = "Category") +
  scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
  theme_minimal()


#---------------------------

# 5. Trend over Time 

ggplot(df, aes(x = date, y = kilolitres, color = dairy_distribution)) +
  geom_line() +
  labs(title = "Monthly Dairy Distribution Trends",
       x = "Date", y = "Kilolitres", color = "Category") +
  scale_y_continuous(labels = function(x) format(x, big.mark = ",", scientific = FALSE)) +
  theme_minimal()

#-----------------------------

# 6. Year over Year % Change 

yoy <- yearly_totals %>%
  group_by(dairy_distribution) %>%
  arrange(year, .by_group = TRUE) %>%
  mutate(yoy_pct = (total_kilolitres / lag(total_kilolitres) - 1) * 100) %>%
  ungroup()

ggplot(yoy, aes(x = year, y = yoy_pct, color = dairy_distribution)) +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_line() +
  geom_point() +
  labs(title = "Year-over-Year % Change in Dairy Distribution",
       x = "Year", y = "% Change", color = "Category") +
  theme_minimal()


#---------------------------------


# 7. Outlier Detection (z-score)

outliers <- df %>%
  group_by(dairy_distribution) %>%
  mutate(z = (kilolitres - mean(kilolitres)) / sd(kilolitres)) %>%
  ungroup() %>%
  filter(abs(z) > 2) %>%
  select(dairy_distribution, reference_period, kilolitres, z) %>%
  arrange(dairy_distribution, desc(abs(z)))

print(outliers)
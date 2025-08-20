# Canada-Dairy-Distribution-Analysis-

# Project Overview : 
This project analyzes milk production and utilization in Canada using the Statistics Canada (Table 32-10-0113-01) dataset.

The focus is on identifying seasonal patterns, yearly trends, and growth dynamics across three categories:

1. Milk sold off farms
2. Industrial use
3. Fluid consumption


By leveraging R and visualization techniques, the project provides insights into Canadian dairy distribution trends and market dynamics.

# Dataset :
1. Source: Statistics Canada – Milk production and utilization (Table 32-10-0113-01)

2. Period Covered: 2000 – 2025 (partial data for 2025)


3. Variables Used :
  Dairy distribution type (Off-farm, Industrial, Fluid)
  Reference period (monthly data)
  Kilolitres


# Tools & Libraries : 
R Programming  
Libraries: tidyverse (dplyr, ggplot2, readr)

# Key Analysis 

1. Data Cleaning & Transformation 
Removed formatting inconsistencies
Converted monthly text into Date format
Extracted year and month for aggregation

2. Summary Statistics 
Mean, median, standard deviation, min, max values per category

3. Seasonality (Average by Month)
Identified monthly peaks and dips across dairy categories


4. Yearly Totals
Tracked long-term growth patterns in distribution


5. Trends Over Time 
Visualized continuous monthly distribution trends


6. Year over Year % Change 
Compared annual growth rates across categories



# Key Insights 

1. Off-farm milk grew from ~650K to 800K KL/month, driven by higher exports and efficiency.

2. Industrial use rose steadily from ~400K to 600K KL/month, with sharp growth after 2014.

3. Fluid consumption remained flat (200K–250K KL/month), indicating a saturated market.

4. Seasonal shifts were noticeable in industrial and off-farm categories, but fluid demand stayed stable.

5. 2025 decline is due to incomplete data, not an actual market downturn.



# How to Run 

1. Clone this repository :
git clone https://github.com/Meemansh06/Canada-Dairy-Distribution-Analysis-
2. Open the R script in RStudio: 
source("Dairy.R")
  
3. Visualizations will be generated for each analysis step. 


# Reference 
Statistics Canada.(2025,June 10). Milk production and utilization (Table 32-10-0113-01).
https://doi.org/10.25318/3210011301-eng

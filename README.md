# Canada-Dairy-Distribution-Analysis-

# Project Overview : 
This project analyzes milk production and utilization in Canada using the Statistics Canada (Table 32-10-0113-01) dataset.

The focus is on identifying seasonal patterns, yearly trends, and growth dynamics across three categories:

1. Milk sold off farms
2. Industrial use
3. Fluid consumption


By leveraging R and visualization techniques, the project provides insights into Canadian dairy distribution trends and market dynamics.

# Dataset :
## 1. Source: 
Statistics Canada – Milk production and utilization (Table 32-10-0113-01)

## 2. Period Covered
 2000 – 2025 (partial data for 2025)


## 3. Variables Used 
  Dairy distribution type (Off-farm, Industrial, Fluid)
  Reference period (monthly data)
  Kilolitres


# Tools & Libraries : 
R Programming  
Libraries: tidyverse (dplyr, ggplot2, readr)

# Key Analysis 

## 1. Data Cleaning & Transformation 
Removed formatting inconsistencies
Converted monthly text into Date format
Extracted year and month for aggregation

## 2. Summary Statistics 
Mean, median, standard deviation, min, max values per category

## 3. Seasonality (Average by Month)
Identified monthly peaks and dips across dairy categories


## 4. Yearly Totals
Tracked long-term growth patterns in distribution


## 5. Trends Over Time 
Visualized continuous monthly distribution trends


## 6. Year over Year % Change 
Compared annual growth rates across categories



# Key Insights 

## 1. Off-Farm Milk Sales (Exports & Efficiency)
   Showed the strongest upward growth, increasing from ~650K to ~800K kilolitres monthly.
   This reflects rising export demand and improved production efficiency in Canada.



## 2. Industrial Use (Processing & Growth after 2014)
   Rose steadily from ~400K to ~600K kilolitres, with a sharp surge post-2014.
   Suggests expanded processing capacity and stronger global demand for dairy-based products.


## 3. Fluid Consumption (Stable, Saturated Market)
   Remained stable between 200K–250K kilolitres.
   Indicates flat domestic consumption despite population growth, likely due to dietary shifts and substitutes (e.g.,        plant-based milk).



## 4. Seasonal Patterns
  Peaks in March and October, dips in February and September.
  Linked to consumer demand cycles, production seasonality, and supply chain timing.
  
  

## 5. Year-over-Year % Change
  Industrial and off-farm categories show higher volatility, while fluid milk fluctuates minimally (~0% change).
  Confirms that the fluid milk market is saturated, while exports and industrial demand are growth drivers. 

## 6. Note on 2025 Decline
  The sharp drop in 2025 is due to incomplete data (only partial year available), not an actual market downturn. 

# Conclusion 

1. Canada’s dairy industry growth is export- and processing-driven, not consumer-driven.

2. Industrial and off-farm milk categories are expanding, reflecting globalization and supply chain strength.

3. Fluid milk is stagnant, suggesting consumer preference shifts and a mature domestic market.

4. Seasonal cycles and year-over-year changes highlight production dependencies and market stability in certain segments.




# How to Run 

1. Clone this repository :
git clone https://github.com/Meemansh06/Canada-Dairy-Distribution-Analysis-
2. Open the R script in RStudio: 
source("Dairy.R")
  
3. Visualizations will be generated for each analysis step. 


# Reference 
Statistics Canada.(2025,June 10). Milk production and utilization (Table 32-10-0113-01).
https://doi.org/10.25318/3210011301-eng

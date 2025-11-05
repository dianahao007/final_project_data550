# CDC Obesity Analysis – Behavioral Risk Factor Surveillance System (BRFSS)

**Author:** Zixuan Hao  
**Date:** November 2025  

---

## 🧭 Overview
This project conducts an exploratory analysis of data from the **CDC’s Behavioral Risk Factor Surveillance System (BRFSS)**, focusing on **obesity prevalence by race/ethnicity in Georgia (2011)**.

The workflow demonstrates reproducible data science principles:
- Organized file structure
- Reproducible scripts using `here`
- Automation with a `Makefile`
- Modular analysis (analysis scripts, saved outputs, and report rendering)

---
## 📁 Project Structure

final_project_R


-**code**/
code_analysis.R _# Script that processes data and generates outputs_
-**code**/
render_report.R _# Script to knit the R Markdown_


-**data**/
brfss_obesity.csv _# Input dataset_


-**output**/
table1.rds _# Saved summary table_
-**output**/
figure1.rds _# Saved ggplot figure_

-FinalProject_R_ZixuanHao.Rmd _# Main report that imports outputs_

-FinalProject_R_ZixuanHao.html _# Rendered HTML report_

-Makefile _# Automates build and cleanup_

-final_project_R.Rproj _# RStudio project file_

-README.md _# Documentation_

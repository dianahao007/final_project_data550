# CDC Obesity Analysis – Behavioral Risk Factor Surveillance System (BRFSS)

**Author:** Zixuan Hao  
**Date:** Deccember 2025  

---

## 🧭 Overview
This project conducts an exploratory analysis of data from the **CDC’s Behavioral Risk Factor Surveillance System (BRFSS)**, focusing on **obesity prevalence by race/ethnicity in Georgia (2011)**.

The workflow demonstrates reproducible data science principles:
- Organized file structure
- Reproducible scripts using `here`
- Automation with a `Makefile`
- Modular analysis (analysis scripts, saved outputs, and report rendering)
- Equipped with a fully automated Docker pipeline that renders the entire report
  inside a clean container environment
  
# Contents of the Report

* Data Import & Cleaning  
* Descriptive Statistics  
* Obesity Prevalence by Race/Ethnicity  
* Visualization of Key Findings  
* Summary & Interpretation  

# Report Description — FinalProject_R_ZixuanHao.html
- **FinalProject_R_ZixuanHao.html is located in the `/report` folder.**

* **How to steps**
- **use `make install` to install the project environment**
- **use `make all` to run the full analysis pipeline**
- **use `make clean` to clean generated files**
- **use `docker-build` to build a docker image from Dockerfile**
- **use `make docker-report` to run automated report in Mac/Linux system**
- **use `make docker-report-win` to run automated report in windows system**
---
**code/code_analysis.R**  
* Reads the BRFSS dataset (`data/brfss_obesity.csv`)  
* Cleans and recodes variables  
* Creates summary statistics and graphics  
* Saves outputs to `output/table1.rds` and `output/figure1.rds`

**code/render_report.R**  
* Uses `rmarkdown::render()` to knit the main R Markdown file  
* Produces the final HTML report  
* Saves output to `output/FinalProject_R_ZixuanHao.html`

## 📁 Project Structure

final_project_R


- **code/**  
  - `code_analysis.R` — *Processes raw BRFSS data and generates cleaned outputs (tables + figures)*  
  - `render_report.R` — *Knits the final R Markdown report using `rmarkdown::render()`*

- **data/**  
  - `brfss_obesity.csv` — *Raw input dataset used in the analysis*

- **output/**  
  - `table1.rds` — *Saved summary table for use in the final report*  
  - `figure1.rds` — *Saved ggplot figure (obesity by race/ethnicity)*  
  - *May also contain the rendered HTML report, depending on the workflow*

- **renv/**  
  - Folder automatically created by `renv` to store isolated package libraries  
  - Contains:  
    - `activate.R` — *Bootstraps renv when opening the project*  
    - `settings.json` — *Project-level renv configuration*  
    - `library/` — *Local package installations (usually excluded from GitHub)*  

- **report/**
  - FinalProject_R_ZixuanHao.html  (created after `make docker-report`)

- **renv.lock**  
  - Lockfile recording the exact R package versions used in this project for full reproducibility

- **Makefile**  
  - Automates the workflow: environment restoration (`make install`), running analysis scripts, cleaning outputs, and rendering the final report

- **Dockerfile**  
  - The Dockerfile builds a fully reproducible R environment using renv and automatically renders the final HTML report inside an isolated container.

- **final_project_R.Rproj**  
  - RStudio project file that defines the working environment

- **FinalProject_R_ZixuanHao.Rmd**  
  - Main R Markdown file that imports saved outputs and generates the final HTML report

- **README.md**  
  - Documentation describing the purpose, structure, and reproducibility instructions of the project

-------------------------------------------------------------------------------

# Reproducibility With `renv`

This project uses the **renv** package to ensure full reproducibility across systems.

### Restore the exact package environment used in this project:
`make install`

This runs:

`r renv::restore()`


-------------------------------------------------------------------------------

## Local Workflow Using Makefile

Run the entire pipeline:
    make all

Clean all generated output:
    make clean

-------------------------------------------------------------------------------

## Docker Instructions

A complete reproducible image is available on DockerHub at:
    https://hub.docker.com/r/dianahao007/final_project_data550

Pull the Docker image:
    docker pull dianahao007/final_project_data550:latest

Run the automated report generation pipeline:
    docker run --rm \
      -v "$(pwd)/report:/home/rstudio/project/report" \
      dianahao007/final_project_data550:latest

After completion, the file will appear here:
    report/FinalProject_R_ZixuanHao.html

-------------------------------------------------------------------------------

## End of README
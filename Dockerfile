FROM rocker/tidyverse:4.5.1 AS base

# Create project directory for Stage 1
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

# Copy renv configuration files
RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

# Use local renv cache
RUN mkdir -p renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

# Install system dependencies for R packages
RUN apt-get update && apt-get install -y libnode-dev

# Restore package environment inside container
RUN Rscript -e "renv::restore(prompt = FALSE)"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######

FROM rocker/tidyverse:4.5.1

# Create project directory for Stage 2
RUN mkdir -p /home/rstudio/project
WORKDIR /home/rstudio/project

# Copy restored renv library from Stage 1
COPY --from=base /home/rstudio/project .

# Default configuration
ENV WHICH_CONFIG "default"

# Copy project files
COPY Makefile Makefile
COPY code/render_report.R render_report.R
COPY FinalProject_R_ZixuanHao.Rmd FinalProject_R_ZixuanHao.Rmd

# Create directories expected by Makefile
RUN mkdir -p code output data report

# Copy data + code
COPY data data
COPY code code

# FINAL STEP — Generate rep
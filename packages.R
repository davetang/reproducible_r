# packages.R
#
# Install project packages and snapshot the environment.
# Run from the project root: Rscript packages.R

if (!file.exists("renv.lock")) stop("Run this script from the project root.")

# Install packages
renv::install("targets")
renv::install("Seurat")

# Core tidyverse
renv::install("dplyr")
renv::install("ggplot2")
renv::install("tidyr")
renv::install("readr")
renv::install("purrr")
renv::install("tibble")
renv::install("stringr")
renv::install("forcats")

# Record installed packages in renv.lock
renv::snapshot()

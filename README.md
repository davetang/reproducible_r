# README

Reproducible R analyses using [{renv}](https://rstudio.github.io/renv/) for package management and [{targets}](https://books.ropensci.org/targets/) for pipeline orchestration.

## Getting started

### Setup

Clone the repository, then run the setup script from within R:

```r
source("setup.R")
```

Or from the terminal:

```bash
Rscript setup.R
```
```
The following package(s) will be updated in the lockfile:

# CRAN -----------------------------------------------------------------------
- renv   [* -> 1.1.7]

The version of R recorded in the lockfile will be updated:
- R      [* -> 4.5.2]

- Lockfile written to "~/github/reproducible_r/renv.lock".
```

This will:

* Install {renv} if needed
* Restore all packages from `renv.lock` (collaborators), or initialise a fresh environment (first run)

### Adding packages

Install packages via {renv} so they are tracked:

```r
renv::install("dplyr")                       # CRAN
renv::settings$bioconductor.version("3.22")  # run once to set Bioconductor release
renv::install("bioc::edgeR")                 # Bioconductor
renv::install("tidyverse/dplyr")             # GitHub (owner/repo)
renv::install("tidyverse/dplyr@v1.1.0")      # GitHub tag/release
renv::snapshot()                             # update renv.lock after installing
```

## Project structure

```console
tree --charset ascii -L 3 .
```
```
.
|-- LICENSE
|-- README.md
|-- renv
|   |-- activate.R
|   |-- library
|   |   `-- linux-debian-bookworm
|   `-- settings.json
|-- renv.lock
`-- setup.R

4 directories, 6 files
```

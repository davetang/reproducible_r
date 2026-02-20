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

By default renv only snapshots packages that are explicitly referenced via `library()` or `require()`. The snapshot type can be changed to control this behaviour:

| Type                   | Snapshots                                         | Use case               |
|------------------------|---------------------------------------------------|------------------------|
| `"implicit"` (default) | Packages referenced via `library()` / `require()` | Most projects          |
| `"explicit"`           | Packages listed in a `DESCRIPTION` file           | Package development    |
| `"all"`                | Everything installed in the project library       | Exploration / learning |

This project uses `"all"` (set in `setup.R`), so the workflow is simply:

```r
renv::install("dplyr")  # install
renv::snapshot()        # record in renv.lock - no library() call needed
```

To confirm the current snapshot type:

```r
renv::settings$snapshot.type()  # returns the current setting
```

This is actually set in `renv/settings.json`.

```console
cat renv/settings.json
```
```
{
  "bioconductor.version": "3.22",
  "external.libraries": [],
  "ignored.packages": [],
  "package.dependency.fields": [
    "Imports",
    "Depends",
    "LinkingTo"
  ],
  "ppm.enabled": null,
  "ppm.ignored.urls": [],
  "r.version": null,
  "snapshot.dev": false,
  "snapshot.type": "all",
  "use.cache": true,
  "vcs.ignore.cellar": true,
  "vcs.ignore.library": true,
  "vcs.ignore.local": true,
  "vcs.manage.ignores": true
}
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

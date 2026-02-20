# setup.R
#
# Run this script once to initialise the project environment.
# New collaborators should run this after cloning the repository.

# First-time setup: initialise renv and create renv.lock
if (!requireNamespace("renv", quietly = TRUE)) {
  install.packages("renv")
}

# If a lockfile already exists (i.e. you are a collaborator restoring the
# environment), use renv::restore() instead of renv::init().
if (file.exists("renv.lock")) {
  renv::restore()
} else {
  renv::init()
}

renv::settings$bioconductor.version("3.22")

# Snapshot all installed packages, not just those referenced via library().
renv::settings$snapshot.type("all")
message("Snapshot type: ", renv::settings$snapshot.type())

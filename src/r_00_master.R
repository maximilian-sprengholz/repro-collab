####################################################################################################
# 
#     0 -- Example Master File
# 
#     Maximilian Sprengholz / maximilian.sprengholz@hu-berlin.de
# 
####################################################################################################

### settings
set.seed(1234)


### user management

# get user = username on machine
user = Sys.info()[7]

# paths (extend named list by whatever paths you need)
paths = list(
  max = list(
    wd = "/home/max/Seafile/Projects/repro-collab",
    someotherdir = "/home/some/other/dir"
    ),
  edith = list(
    wd = "C:/Users/edith/repro-collab",
    someotherdir = "C:/some/other/dir"
    )
  )
for (key in names(paths[[user]])) {
  do.call("<-", list(key, unlist(paths[[user]][key])))
}


### packages
# these should ideally be installed via conda and added to the environment.yml
# in case the packages are not available from conda (conda-forge), the best way forward is to 
# use the renv package, see:
# https://rstudio.github.io/renv/articles/renv.html
# https://rstudio.github.io/renv/articles/collaborating.html

# Once a local r environment (short = renv) is created, packages can be installed
# using the standard way and saved; and at other times / places restored
# 
# if (!require(tictoc)) install.packages("tictoc")
# library(tictoc)
# renv::snapshot()
#
# renv::restore()
library(tidyverse)
library(ggplot2)
library(stargazer)


### run

source(paste0(wd, "/src/r_01_stuff.R"))


### save packages to renv.lock
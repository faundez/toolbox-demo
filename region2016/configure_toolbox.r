## configure_toolbox.r (this is the first thing I should do, and I could run the whole code or press Source, make sure I have the same directory path as in calculate.scores.r )

## configure_toolbox.r ensures all files in your repo are properly configured. It must be sourced before calculating OHI scores; here or from `calculate_scores.r`.

## You are encouraged to use this script when developing individual goal models. A good workflow is:
  ## 1. prepare data layers in the /prep folders (script as much as possible in R)
  ## 2. register data layers in layers.csv and save them in /layers folder
  ## 3. source configure_repo.r to ensure proper configuration
  ## 4. develop goal models in functions.r, running individual goal models line by line

## load ohicore and tidyverse (includes dplyr, tidyr, stringr, etc) HERE I SHOUKD INCLUDE OTHER PACKAGES IF I NEED FOR MY MODELS
if (!"ohicore" %in% (.packages())) {
  suppressWarnings(require(ohicore))
  library(tidyverse)    # install.packages('tidyverse')
  library(stringr)
}

## set working directory to the scenario that contains conf and layers directories
setwd('~/2017_winter/github/toolbox-demo/region2016')

## load scenario configuration
## 'conf' link all the data layers (for goal, pressures, resilience), goal functions, and other OHI parameters that determines how ohi scores
## are calculated
conf = ohicore::Conf('conf') #ohicore pulls all functions

## check that scenario layers files in the \layers folder match layers.csv registration. Layers files are not modified.
ohicore::CheckLayers('layers.csv', 'layers', flds_id=conf$config$layers_id_fields) # gives the whole list of layers and I can check if my layes are named well and if there is also checking into the folder and see if there is a layer for it

## load scenario layers for ohicore to access. Layers files are not modified.
layers = ohicore::Layers('layers.csv', 'layers') #facilitate the ohicore function


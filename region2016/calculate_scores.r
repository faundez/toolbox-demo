## calculate_scores.R

## calculate_scores.R ensures all files are properly configured and calculates OHI scores.
  ## - configure_toolbox.r ensures your files are properly configured. It is a script in your repository.
  ## - CalculateAll() calculates OHI scores. It is a function in the `ohicore` R package
  ##   (this can be written in R as `ohicore::CalculateAll()`).

## When you begin, configure_toolbox.r and CalculateAll() will calculate scores using
## the 'templated' data and goal models provided. We suggest you work
## goal-by-goal as you prepare data in the prep folder and develop goal models
## in functions.r. Running configure_toolbox.r and a specific goal model line-by-line
## in functions.R is a good workflow.

## run the configure_toolbox.r script to check configuration
source('~/2017_winter/github/toolbox-demo/region2016/configure_toolbox.r') #home can be ~ so github folder should be in my documents that is my home

## calculate scenario scores
scores = ohicore::CalculateAll(conf, layers) #in the console the red words are helpful messages

## save scores as scores.csv
write.csv(scores, 'scores.csv', na='', row.names=F)

#for any change restart R
#go to prep and change your new information in layers.csv and close excel before to run it again
#check in Git if region2016/scores.csv change the way I spect say only AO change


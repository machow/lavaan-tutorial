---
title       : Basics of model syntax, fitting, and inspection
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


--- type:NormalExercise lang:r xp:100 skills:1 key:7d4656bf0c
## The big picture: SEM

This chapter will teach you the basics of structural equation modelling (SEM) with the Lavaan library.
The code on the right specifies an SEM in lavaan.
It then fits the model to the `PoliticalDemocracy` data (which comes with the Lavaan),
before plotting it.

Feel free to experiment with the code before proceeding.

The exercises in this chapter will cover:

* Lavaan syntax basics
* Fitting a simple linear model
* Fitting a confirmatory factor analysis (CFA)
* Fitting a structural equation model (SEM)

**Note: Try doing each exercise on your own, before referring to the official [lavaan tutorial](http://lavaan.ugent.be/tutorial/) for help.**

*** =instructions

* Just hit Submit Answer!

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(lavaan)

# Specify structural equation model (SEM)
model <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ y5 + y6 + y7 + y8
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'

# Fit model to PoliticalDemocracy data
fit <- sem(model, data=PoliticalDemocracy)

# Summarize fitted model parameters
summary(fit, standardized=TRUE)

# Plot graph of model
library(semPlot)
semPaths(fit, what='par', edge.color='black', fade=FALSE)
```

*** =solution
```{r}

```

*** =sct
```{r}

```


--- type:NormalExercise lang:r xp:100 skills:1 key:4718004518
## Formula operators

There are essentially four basic operators for relating variables in lavaan:

* `a =~ y1`                                - a is measured by y1
* `a ~ y1 `&nbsp;&nbsp;                    - a is regressed on y1
* `a ~ 1  `&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  - the intercept of a
* `a ~~ y1`                                - the covariance of a and y1

See the [syntax page](http://lavaan.ugent.be/tutorial/syntax1.html) of the official tutorial for further explanation.

*** =instructions

* Run the code to plot each operation.

<br>
**Note: To run a highlighted block of code, press ctrl+enter.**


*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(semPlot)

# a is a latent variable, measured by y1
model1 <- "a =~ y1"
semPaths(model1, residuals=F)

# a is regressed on y1
model2 <- "a ~ y1"
semPaths(model2, residuals=F)

# the intercept of a
model3 <- "a ~ 1"
semPaths(model3, residuals=F)

# a covaries (e.g. is correlated) with y1
model4 <- "a ~~ y1"
semPaths(model4, residuals=F)
```

*** =solution
```{r}

```

*** =sct
```{r}
success_msg("Great work! See the [syntax page](http://lavaan.ugent.be/tutorial/syntax1.html) of the official tutorial for more.")
```

--- type:NormalExercise lang:r xp:100 skills:1 key:473d27be37
## Formula operators combined

### + operator
If two parts of a formula have the same left-hand side (LHS), then they can be combined into one line.
In this case, each piece on the right-hand side RHS is separated by a `+`.

For example, 

```
g =~ m1
g =~ m2
```

Is the same as `g =~ m1 + m2`.

### comments with # #

In a formula, any code after a `#` is a comment (it's not included in the formula).

For example,

```
a =~ y1    # a is measured by y1
```

*** =instructions

* plot model1 using `semPaths`
* fill-in model2 to be the same model in one line, using the `+` operator
* plot model2 using `semPaths`

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# model that specifies 3 parameters
model1 <- "
    a =~ y1   # a as measured by y1
    a =~ y2   # a as measured by y2
    a =~ y3   # a as measured by y3
"
semPaths(___, residuals=F)

model2 <- ___
semPaths(___, residuals=F)
```

*** =solution
```{r}
library(semPlot)

# model that specifies 3 parameters
model1 <- "
    a =~ y1   # a as measured by y1
    a =~ y2   # a as measured by y2
    a =~ y3   # a as measured by y3
"
semPaths(model1, residuals=F)

model2 <- "a =~ y1 + y2 + y3"
semPaths(model2, residuals=F)
```

*** =sct
```{r}

```
--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:6ece34460c
## Describe this formula (1)

`"x ~ y"`


*** =instructions

* x is measured by y
* x is regressed on y
* x is correlated with y
* x intercept

*** =hint

*** =pre_exercise_code
```{r}
```

*** =sct
```{r}
msgs <- c(
    'that formula is `"x =~ y"`',
    'that formula is `"x ~ y"`',
    'that formula is `"x ~~ y"`',
    'that formula is `"x ~ 1"`'
    )
test_mc(2, feedback_msgs = msgs)
```
--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:b77ae26b49
## Describe this formula (2)

`"x ~~ y"`


*** =instructions

* x is measured by y
* x is regressed on y
* x is correlated with y
* x intercept

*** =hint

*** =pre_exercise_code
```{r}
```

*** =sct
```{r}
msgs <- c(
    'that formula is `"x =~ y"`',
    'that formula is `"x ~ y"`',
    'that formula is `"x ~~ y"`',
    'that formula is `"x ~ 1"`'
    )
test_mc(3, feedback_msgs = msgs)
```
--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:ce168be704
## Describe this formula (3)

`"x =~ y"`


*** =instructions

* x is measured by y
* x is regressed on y
* x is correlated with y
* x intercept

*** =hint

*** =pre_exercise_code
```{r}
```

*** =sct
```{r}
msgs <- c(
    'that formula is `"x =~ y"`',
    'that formula is `"x ~ y"`',
    'that formula is `"x ~~ y"`',
    'that formula is `"x ~ 1"`'
    )
test_mc(1, feedback_msgs = msgs)
```
--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:8c83b71b3f
## Describe this formula (4)

`"x ~ 1"`


*** =instructions

* x is measured by y
* x is regressed on y
* x is correlated with y
* x intercept

*** =hint

*** =pre_exercise_code
```{r}
```

*** =sct
```{r}
msgs <- c(
    'that formula is `"x =~ y"`',
    'that formula is `"x ~ y"`',
    'that formula is `"x ~~ y"`',
    'that formula is `"x ~ 1"`'
    )
test_mc(4, feedback_msgs = msgs)
```


--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:a6446efabb
## Describe this path (1)

What is the syntax for the path in the graph?

*** =instructions

* `"x =~ y"`
* `"x ~ y"`
* `"x ~~ y"`
* `"x ~ 1"`

*** =hint

*** =pre_exercise_code
```{r}
library(lavaan)
library(semPlot)
mod <- lavaanify('x ~ 1')
semPaths(mod, residuals=FALSE)
```

*** =sct
```{r}
msgs <- c(
    'that would be a circle -> square',
    'that would be a square -> square',
    'that would be shape <-> shape',
    'that would be a triangle -> x'
    )
test_mc(4, feedback_msgs = msgs)
```

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:efaf2cc2fb
## Describe this path (2)

What is the syntax for the path in the graph?

*** =instructions

* `"x =~ y"`
* `"x ~ y"`
* `"x ~~ y"`
* `"x ~ 1"`

*** =hint

*** =pre_exercise_code
```{r}
library(lavaan)
library(semPlot)
mod <- lavaanify('x ~~ y; x =~ a + b; y =~ c + d;')
semPaths(mod, residuals=FALSE, structural=TRUE)
```

*** =sct
```{r}
msgs <- c(
    'that would be a circle -> square',
    'that would be a square -> square',
    'that would be shape <-> shape',
    'that would be a triangle -> x'
    )
test_mc(3, feedback_msgs = msgs)
```

--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:00d0b55078
## Describe this path (3)

What is the syntax for the path in the graph?

*** =instructions

* `"x =~ y"`
* `"x ~ y"`
* `"x ~~ y"`
* `"x ~ 1"`

*** =hint

*** =pre_exercise_code
```{r}
library(lavaan)
library(semPlot)
mod <- lavaanify('x ~ y')
semPaths(mod, residuals=FALSE)
```

*** =sct
```{r}
msgs <- c(
    'that would be a circle -> square',
    'that would be a square -> square',
    'that would be shape <-> shape',
    'that would be a triangle -> x'
    )
test_mc(2, feedback_msgs = msgs)
```


--- type:MultipleChoiceExercise lang:r xp:50 skills:1 key:f8440b5fe8
## Describe this path (4)

What is the syntax for the path in the graph?

*** =instructions

* `"x =~ y"`
* `"x ~ y"`
* `"x ~~ y"`
* `"x ~ 1"`

*** =hint

*** =pre_exercise_code
```{r}
library(lavaan)
library(semPlot)
mod <- lavaanify('x =~ y')
semPaths(mod, residuals=FALSE)
```

*** =sct
```{r}
msgs <- c(
    'that would be a circle -> square',
    'that would be a square -> square',
    'that would be shape <-> shape',
    'that would be a triangle -> x'
    )
test_mc(1, feedback_msgs = msgs)
```






--- type:NormalExercise lang:r xp:100 skills:1 key:2657c5cf42
## Rewrite this formula



*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(semPlot)
# model with latent variables visual and textual
# this model is called a confirmatory factor analysis (CFA)
model1 <- "
    visual =~ x1
    visual =~ x2
    visual =~ x3
    
    textual =~ x4
    textual =~ x5
    textual =~ x6
"
semPaths(___, residuals=F)

model2 <- ___
semPaths(___, residuals=F)
```

*** =solution
```{r}
library(semPlot)
# model with latent variables visual and textual
# this model is called a confirmatory factor analysis (CFA)
model1 <- "
    visual =~ x1
    visual =~ x2
    visual =~ x3
    
    textual =~ x4
    textual =~ x5
    textual =~ x6
"
semPaths(model1, residuals=F)

model2 <- "
    visual =~ x1 + x2 + x3
    textual =~ x4 + x5 + x6
"
semPaths(model2, residuals=F)
```

*** =sct
```{r}

```
--- type:NormalExercise lang:r xp:100 skills:1 key:b20514ae47
## Simple Linear Model: specification



*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(semPlot)
model1 <- "
    ___        # hp regressed on wt
    ___        # intercept of hp
"
semPlot(model1, residuals=F)
```

*** =solution
```{r}
library(semPlot)
# model with each piece on a separate line
model1 <- "
    hp ~ wt        # hp regressed on wt
    hp ~ 1         # intercept of hp
"

semPaths(model1, residuals=F)
```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:b688b6269e
## Simple Linear Model: fitting


*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(lavaan)

# same model as prev exercise: hp regressed on wt, with intercept
model <- "hp ~ 1 + wt"

lm_fit  <-  lm(model,  data = mtcars)  # using R's linear model function 
lav_fit <- sem(model,  data = mtcars)  # using Lavaan's sem function

# note the similarity of the coefficients
coef(lm_fit)
coef(lav_fit)              # will explain hp ~~ hp in next exercise

# Plot
library(semPlot)
semPaths(lav_fit, what='par')
```

*** =solution
```{r}
library(lavaan)

# same model as prev exercise: hp regressed on wt, with intercept
model <- "hp ~ 1 + wt"

lm_fit  <-  lm(model,  data = mtcars)  # using R's linear model function 
lav_fit <- sem(model,  data = mtcars)  # using Lavaan's sem function

# note the similarity of the coefficients
coef(lm_fit)
coef(lav_fit)              # will explain hp ~~ hp in next exercise

# Plot
library(semPlot)
semPaths(lav_fit, what='par')
```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:7316d96fbc
## Simple Linear Model: expanding to multiple regression

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
library(lavaan)

# specify model to be hp with intercept, regressed on wt, mpg, and cyl
model <- ___

lm_fit  <-  lm(model,  data = mtcars)  # using R's linear model function 
lav_fit <- sem(model,  data = mtcars)  # using Lavaan's sem function

# note the similarity of the coefficients
coef(lm_fit)
coef(lav_fit)

# Plot
library(semPlot)
semPaths(lav_fit, what='par', edge.color='black')

```

*** =solution
```{r}
library(lavaan)

# specify model to be hp with intercept, regressed on wt, mpg, and cyl
model <- "hp ~ 1 + wt + mpg + cyl"

lm_fit  <-  lm(model,  data = mtcars)  # using R's linear model function 
lav_fit <- sem(model,  data = mtcars)  # using Lavaan's sem function

# note the similarity of the coefficients
coef(lm_fit)
coef(lav_fit)

# Plot
library(semPlot)
semPaths(lm_fit, "est", fade=FALSE)
semPaths(lav_fit, "est", fade=FALSE)
```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:06b18ed17b
## CFA model: specification

*** =instructions

* Define `HS.model` to be the CFA on the right, using lavaan syntax.

*** =hint

*** =pre_exercise_code
```{r}
library(semPlot)
library(lavaan)

.mod <- ' 
    visual  =~ x1 + x2 + x3      
    textual =~ x4 + x5 + x6
    speed   =~ x7 + x8 + x9 '

semPaths(lavaanify(.mod),
         residuals = FALSE,
         fixedStyle = 'black', freeStyle = 'black', nCharNodes = 0)

```

*** =sample_code
```{r}
library(lavaan)

# specify the model
HS.model <- ___

# display summary output
library(semPlot)
semPaths(HS.model)

```

*** =solution
```{r}
# load the lavaan package (only needed once per session)
library(lavaan)

# specify the model
HS.model <- ' visual  =~ x1 + x2 + x3      
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

# display summary output
library(semPlot)
semPaths(HS.model)
```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:2f3ceb3b77
## CFA model: fitting

*** =instructions

Fill in the blank for the second `cfa` call.

- Add an argument so the latent variables are **orthogonal**.
- Add an argument so the latent variables are **standardized**.
- Look at the coefficients of each fit--how do they differ?

*** =hint
- hint 1

*** =pre_exercise_code
```{r}
# load the lavaan package (only needed once per session)
library(lavaan)
library(semPlot)
# specify the model
HS.model <- ' visual  =~ x1 + x2 + x3      
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
```

*** =sample_code
```{r}
# We've already loaded semPlot and lavaan
# HS.model is already defined for you
fit <- cfa(HS.model, data=HolzingerSwineford1939)
coef(fit)
semPaths(fit)

# Fit orthogonal, and standardized latent variables
std_fit <- cfa(___)
coef(std_fit)
semPaths(std_fit)

```

*** =solution
```{r}
# We've already loaded semPlot and lavaan
# HS.model is already defined for you
fit <- cfa(HS.model, data=HolzingerSwineford1939)
coef(fit)
semPaths(fit)

# Fit orthogonal, and standardized latent variables
std_fit <- cfa(HS.model, data=HolzingerSwineford1939,
               orthogonal = TRUE,
               std.lv = TRUE)
coef(std_fit)
semPaths(std_fit)
```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki
```

--- type:NormalExercise lang:r xp:100 skills:1 key:198bfbf96c
## SEM: specification

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}
library(semPlot)
.model <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ y5 + y6 + y7 + y8
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'

semPaths(.model, 
         residuals = FALSE,
         sizeLat = c(10,10),
         fixedStyle = 'black', freeStyle = 'black', nCharNodes = 0)

rm(.model)
```

*** =sample_code
```{r}

```

*** =solution
```{r}
model <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ y5 + y6 + y7 + y8
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'

library(semPlot)
semPaths(model, residuals=FALSE)
```

*** =sct
```{r}

# crazy success msg
success_msg("Great job! To make the plot identical to the first one, use
```
semPaths(model, 
         residuals = FALSE,
         sizeLat = c(10,10),
         fixedStyle = 'black', freeStyle = 'black', nCharNodes = 0)
```
")
# / crazy success msg

```

--- type:NormalExercise lang:r xp:100 skills:1 key:ae4d539efd
## SEM: fitting


*** =instructions

- rather than setting `std.lv` when fitting the model, pass `standardize = TRUE` to the `summary` function.

*** =hint

*** =pre_exercise_code
```{r}
library(lavaan) # only needed once per session
library(semPlot)
model <- '
  # measurement model
    ind60 =~ x1 + x2 + x3
    dem60 =~ y1 + y2 + y3 + y4
    dem65 =~ y5 + y6 + y7 + y8
  # regressions
    dem60 ~ ind60
    dem65 ~ ind60 + dem60
  # residual correlations
    y1 ~~ y5
    y2 ~~ y4 + y6
    y3 ~~ y7
    y4 ~~ y8
    y6 ~~ y8
'
```

*** =sample_code
```{r}
# We've already loaded lavaan and semPlot for you
# We've already defined the model for you
fit <- sem(model, data=PoliticalDemocracy)

# Modify so results are standardized
summary(fit)

# Modify so it plots the standardized results
semPaths(fit, what='est', fade=F, residuals=F, edge.color = 'black')
```

*** =solution
```{r}
# We've already loaded lavaan and semPlot for you
# We've already defined the model for you
fit <- sem(model, data=PoliticalDemocracy)

# Modify so results are standardized
summary(fit, standardize = TRUE)

# Modify so it plots the standardized results
semPaths(fit, what='std', fade=F, residuals=F, edge.color = 'black')
```

*** =sct
```{r}

```

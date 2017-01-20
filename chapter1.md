---
title       : Basics of model syntax, fitting, and inspection
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


--- type:NormalExercise lang:r xp:100 skills:1 key:7d4656bf0c
## The big picture: CFA

*** =instructions

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}
# load the lavaan package (only needed once per session)
library(lavaan)

# specify the model
HS.model <- ' visual  =~ x1 + x2 + x3      
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '

# fit the model
fit <- cfa(HS.model, data=HolzingerSwineford1939)

# plot graph of model
library(semPlot)
semPaths(fit)
```

*** =solution
```{r}

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




--- type:NormalExercise lang:r xp:100 skills:1 key:06b18ed17b
## CFA model: specification

*** =instructions


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
         fixedStyle = 'black', freeStyle = 'black')

```

*** =sample_code
```{r}

```

*** =solution
```{r}
# load the lavaan package (only needed once per session)
library(lavaan)

# TODO: CUT ---------------------------------------------------
# specify the model
HS.model <- ' visual  =~ x1 + x2 + x3      
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
# /CUT --------------------------------------------------------

# fit the model
fit <- cfa(HS.model, data=HolzingerSwineford1939)

# display summary output
library(semPlot)
semPaths(fit)
```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:2f3ceb3b77
## CFA model: fitting

*** =instructions
- instruction 1

*** =hint
- hint 1

*** =pre_exercise_code
```{r}
# load the lavaan package (only needed once per session)
library(lavaan)

# specify the model
HS.model <- ' visual  =~ x1 + x2 + x3      
              textual =~ x4 + x5 + x6
              speed   =~ x7 + x8 + x9 '
```

*** =sample_code
```{r}

```

*** =solution
```{r}
# NOTE: the HS.model has already been defined for you

# fit the model
fit <- cfa(HS.model, data=HolzingerSwineford1939)

# TODO alternative (e.g. bootstrap)

# display summary output
summary(fit, fit.measures=TRUE)

```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki
```

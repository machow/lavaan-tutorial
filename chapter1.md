---
title       : Basics of model syntax, fitting, and inspection
description : Insert the chapter description here
attachments :
  slides_link : https://s3.amazonaws.com/assets.datacamp.com/course/teach/slides_example.pdf


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

--- type:NormalExercise lang:r xp:100 skills:1 key:06b18ed17b
## Overview

*** =instructions

![](img/author_image.png)

*** =hint

*** =pre_exercise_code
```{r}

```

*** =sample_code
```{r}

```

*** =solution
```{r}

```

*** =sct
```{r}

```

--- type:NormalExercise lang:r xp:100 skills:1 key:2f3ceb3b77
## Model syntax

*** =instructions
- instruction 1

*** =hint
- hint 1

*** =pre_exercise_code
```{r}
# You can also prepare your dataset in a specific way in the pre exercise code
```

*** =sample_code
```{r}

```

*** =solution
```{r}
```

*** =sct
```{r}
# SCT written with testwhat: https://github.com/datacamp/testwhat/wiki
```

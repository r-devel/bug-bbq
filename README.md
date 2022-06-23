# Bug BBQ

Bug Barbeque (Bug BBQ) is global, online event spread over 24 hours, where members of the R community work on open bugs on R's bug-tracker: [R Bugzilla](https://bugs.r-project.org/). 
The event is open to both new and experienced contributors.

This repository is designed to coordinate the activity of participants during the event.

## Types of contribution

Open bugs will require different contributions depending on the quality of the original bug report and the action that has already been taken by R Core developers or other contributors.
The Bug BBQ organizers have added issues on this repo corresponding to bugs on R Bugzilla with labels representing the required actions, as below:


| Issue Label        | Required contribution                                           | Required expertise     | Required setup                              |
|--------------------|-----------------------------------------------------------------|------------------------|---------------------------------------------|
| `needs reprex`     | Write a minimal reproducible example that reproduces the bug  | R                      | R (version specified in bug report)           |
| `check in r-devel` | Check that the bug still exists in the development version of R | R                      | R-devel version                             |
| `needs diagnosis`  | Track down the cause of the bug, or identify as not a bug       | R, possibly C/Fortran | R version specified in bug report or later |
| `discuss fix`      | Add to the discussion of how to fix the bug          | R/C/Fortran/statistics/technical writing/etc  |  N/A                 |
| `needs patch`      | Implement the agreed fix and prepare a patch for review         | R, possibly C/Fortran | Source code for R                             |
| `review patch`      | Test/review the proposed patch         | R/C/Fortran/statistics/technical writing/etc | Source code for R (perhaps)                            |

More detail on the types of contribution is given in the sections below. The [Setup for contribution](#setup-for-contribution) section gives some guidance on getting the setup - note the required setup depends on the type of contribution you are making.

### `needs reprex`

A [minimal reproducible example](https://stackoverflow.com/a/5963610/173755) (reprex) is needed when it is not clear from the report how to reproduce the bug, or the example given in the report is too complex to use for diagnosis (e.g. it uses a large data set, depends on too many packages, or has too many steps not related to the bug).

 - [Install or get access to the version of R stated in the bug report](#use-a-specific-version-of-R) if you cannot reproduce the bug in your current version.
 - Create a reprex using a standard data set, or simplify the existing example as much as possible, while still reproducing the bug.
 - Post your reprex as a comment on the corresponding GitHub issue, adding `@r-devel/triagers` to notify the triage team of the change.
 
TIP: You can use the [**reprex**](https://github.com/tidyverse/reprex) package to prepare your reprex for posting on GitHub

### `check in r-devel`

A reported bug may have been fixed in a more recent release of R or in the development version ("R-devel"). So it is best to check if the bug is still an issue in R-devel before anyone spends time on diagnosis or fixing the bug.

 - [Install or get access to the development version of R](#install-r-devel)
 - Run the reproducible example or follow the steps outlinethe functiond in the bug report
 - On the corresponding GitHub issue:
     - Report if the bug is still an issue in R-devel 
     - Note exact version of R-devel that you checked
     - Add `@r-devel/triagers` to notify the triage team of your report

### `needs diagnosis`

Once the bug is reproducible in the development version of R, the cause of the bug should be diagnosed. This means tracking down the line of code that produces the bug and understanding why it happens. At this stage, the objective is not to propose a fix, but to clarify what causes the reported behaviour.

 - Explore the reprex interactively in a version of R where the bug can be reproduced ([the version of R stated in the bug report](#use-a-specific-version-of-R) or later), to diagnose the bug
 - Decide which category the bug falls into:
     - `not a bug`: the behaviour appears unexpected to the reporter because they misunderstand the purpose of the function or the documentation of the function. In other words, the behaviour is a feature not a bug.
     - `wishlist`: the behaviour is as documented, but the reporter wishes for a different behaviour. In other words, the bug report is actually a feature request.
     - `confirmed bug`: the behaviour is not as documented - there is something wrong with the code or it does not handle a particular case appropriately.
 - Report your analysis on the corresponding GitHub issue:
     - State exactly where and why the bug happens. If the bug is in the underlying C/Fortran code and you do not know how to debug this, then state the line of R code making the relevant call.
     - State the category of bug (not a bug/wishlist/confirmed bug)    
     - Add `@r-devel/triagers` to notify the triage team of your report
     
TIP: helpful functions for debugging are `traceback()`, `debug()`, `debugonce()` and `trace()`.

### `discuss fix`

Once the cause of the bug is known, there should be a discussion about how to fix it. This may require specialist expertise in programming or the methodology being implemented. If you feel equipped to comment, you can share your opinions about any proposed approach or propose your own approach. A [member of R Core](https://www.r-project.org/contributors.html) will need to approve a proposed approach before it should be implemented.

 - Add a comment to the GitHub issue corresponding to the bug.
 - Follow the repo to be notified of any responses and respond if you have further comment, or show your reaction by adding emoji.

### `needs patch`

Once there is agreement from a member of R Core on how to fix a bug, you can implement the fix.

 - Check out the latest version of the source code for R (see further comments below)
 - Make changes to the code to implement your fix
 - Prepare a patch, that is, a file showing the differences between your code and the checked out version of the R sources
 - Test your patch
 - Add a comment to the corresponding GitHub issue with your patch
 - Add `@r-devel/triagers` to notify the triage team

You can check out the R sources from the [R project Subversion repository](https://svn.r-project.org/R/) or from the [GitHub mirror](https://github.com/r-devel/r-svn). If you are new to contributing, we recommend using the GitHub mirror as it requires less setup to test patches (no need to be able to build R yourself). As you become more experienced, it is advisable to use the Subversion mirror and get set up to build R locally as it will be easier to test your changes locally. 

Instructions to get a copy of the source code, prepare and test a patch:
 - [Using a clone of the GitHub mirror](https://github.com/r-devel/r-svn#testing-patches)
 - [Using a check out of the Subversion repository](https://www.r-project.org/bugs.html#how-to-submit-patches)
 
TIP: If you want to modify an R function, search the source code for the relevant R script. E.g. the definition of `labels.lm()` is in `src/library/stats/R.lm.R`. You can modify this function and source it into R. However, for the function to be able to find functions in the package namespace, you will also need to set the environment of the function, e.g. `environment(labels.lm) <- asNamespace('stats')`. This way, you can interactively edit and test your modified function.

## `review patch`

Once a patch is proposed, it can be helpful for others to review the patch. This is particularly helpful for patches to the documentation, to check that the proposed change is more understandable to a general audience.

* Review the bug report and any comments
* Review the proposed patch
* Report back on the GitHub issue:
    * Does the patch resolve the bug?
    * Do you have any feedback that could improve the patch?
    
TIP: If it is a code patch, you may want to test it interactively rather than simply viewing the diff. Use the instructions from the last section to obtain a local copy of the R sources. Then apply the patch by running the command `patch -p0 < somefile.diff` in a terminal, where `somefile.diff` is the diff file for the patch, which you can add temporarily to the root of the checked out repository. The patch command is available on Linux/Mac OS and will be available in the RStudio terminal on Windows if you have [RTools](https://cran.r-project.org/bin/windows/Rtools/) installed. Ideally you would patch an installed version of R-devel, to ensure that code outside the patch is up-to-date.

## Setup for contribution

### Use a specific version of R

Before accessing/installing the version of R specified in the bug report, you might check if your current version of R serves the purpose (allows you to reproduce the bug). Otherwise you can access/install old versions of R as detailed below.

<!--
#### Access old versions of R

RStudio have kindly set up an RStudio server for the Bug BBQ, to make it easy to access old version of R up to 6 years back, as well as the current R-devel version. Log in using your GitHub account and select the desired R version in the drop-down menu

Thanks to @edavidaja and @colearendt for their work setting this up!

-->

#### Access old versions of R

https://rstudio.cloud/ personal workspaces provide a drop-down menu where you can select major versions of R up to 6 years back from the current release version (you can use this for free for 25 hours/month).

#### Install old versions of R

If you prefer to install a specific version of R, the easiest is to install from a binary.

For Windows or MacOS, the **groundhog** package provides helpful documentation on installing different versions of R side-by-side (rather than overwriting the current version each time): https://groundhogr.com/many.

For Linux, the RStudio docs provide similar documentation: https://docs.rstudio.com/resources/install-r/

### Use the development version, R-devel

<!--

#### Access R-devel

The easiest way to access the current version of R-Devel is to use the RStudio server as described in the section [Access old versions of R](#Access-old-versions-of-R)

-->

To use the latest version of R-devel you will need to install it or build it from source. If you are new to contributing, we recommend to install from a binary or use Rocker, otherwise it can take a long time to ensure you have all the prerequisites installed to build R successfully.

#### Install R-devel from a binary

For Windows and Mac OS, it is easiest to install R-devel from the binaries that are built on a daily basis:

 - Windows binary: https://cran.r-project.org/bin/windows/base/rdevel.html
 - MacOS binary: https://mac.r-project.org/
 
For Linux, you can have the choice of installing a Docker image or building R from source.

#### Build a Docker container with R-devel  

The Rocker project provides Docker images with customized R environments. You can use one of the configurations (a Docker file) to build a container, i.e. a virtual, self-contained environment on your computer, that runs the Debian distribution of Linux and has R-devel pre-installed.

1. [Install Docker](https://docs.docker.com/get-docker/) if you don't yet have it.
2. Pull your preferred image, either with bash:
    ````docker pull rocker/r-devel:latest````
   or with RStudio Server:
    ````docker pull rocker/rstudio````
3. Run the container. For the container with bash:
    ````docker run -e --rm -it rocker/r-devel:latest bash````
    Running the command `R` in bash will start the latest R-release version, while the command `RD` will start the latest R-devel version.
   For the container with RStudio server, pick a password and replace `yourpasswordhere` with your password in the following:
    ````docker run --rm --name=rstudio-devel -d -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio:devel````
    Navigate to http://localhost:8787 then login with username `rstudio` and your chosen password.

#### Install from source

Full instructions to install from source are in the R manuals: https://cran.r-project.org/doc/manuals/r-release/R-admin.html. A quick version is provided in the RStudio documentation: https://docs.rstudio.com/resources/install-r-source/.




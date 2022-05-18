# Bug BBQ

Bug Barbeque (Bug BBQ) is global, online event spread over 24 hours, where members of the R community work on open bugs on R's bug-tracker: [R Bugzilla](https://bugs.r-project.org/). 
The event is open to both new and experienced contributors.

This repository is designed to coordinate the activity of participants during the event.

## Types of contribution

Open bugs will require different contributions depending on the quality of the original bug report and the action that has been taken by R Core developers or other contributors.
The Bug BBQ organizers have added issues on this repo corresponding to bugs on R Bugzilla with labels representing the required actions, as below:


| Issue Label        | Required contribution                                           | Required expertise     | Required setup                              |
|--------------------|-----------------------------------------------------------------|------------------------|---------------------------------------------|
| `needs reprex`     | Write a minimal reproducible example that demonstrates the bug  | R                      | R (version specified in bug report)           |
| `check in r-devel` | Check that the bug still exists in the development version of R | R                      | R-devel version                             |
| `needs diagnosis`  | Track down the cause of the bug, or identify as not a bug       | R, possibly C/Fortran | R version specified in bug report or later |
| `discuss fix`      | Add comment(s) discussion on how to fix the bug                 | R/C/Fortran/statistics/technical writing/etc  |  N/A                 |
| `needs patch`      | Implement the agreed fix and prepare a patch for review         | R, possibly C/Fortran | R source code                               |

Other: `review patch`: test/review a proposed patch?

More detail on the types of contribution is given in the sections below. For guidance on the required setup, see the next section

### `needs reprex`

A minimal reproducible example (reprex) is needed when it is not clear from the report how to reproduce the bug, or the example given in the report is too complex to use for diagnosis (e.g. it uses a large data set, depends on too many packages, or has too many steps not related to the bug).

 - Install or get access to the version of R stated in the bug report if you cannot reproduce the bug in your current version.
 - Create a reprex using a standard data set, or simplify the existing example as much as possible, while still reproducing the bug.
 - Post your reprex as a comment on the corresponding GitHub issue, adding `@r-devel/triagers` to notify the triage team of the change.

### `check in r-devel`

A reported bug may have been fixed in a more recent release of R or in the development version ("R-devel"). So it is best to check if the bug is still an issue in R-devel before spending time on diagnosis or fixing.

 - Install or get access to the development version of R
 - Run the reproducible example or follow the steps outlined in the bug report
 - On the corresponding GitHub issue:
     - Report if the bug is still an issue in R-devel 
     - Note exact version of R-devel that you checked
     - Add `@r-devel/triagers` to notify the triage team of your report

### `needs diagnosis`

Once the bug is reproducible in the development version of R, the cause of the bug should be diagnosed. This means tracking down the line of code that produces the bug and understanding why it happens. At this stage, the objective is not to propose a fix, but to clarify what causes the reported behaviour.

    - Explore the reprex interactively, either in the version of R in the bug report or in a development version of R, to diagnose the bug
    - Decide which category the bug falls into:
        - `not a bug`: the behaviour appears unexpected to the reporter because they misunderstand the purpose of the function or the function documentation. In other words, the behaviour is a feature not a bug.
        - `wishlist`: the behaviour is as documented, but the reporter wishes for a different behaviour. In other words, the bug report is actually a feature request.
        - `confirmed bug`: the behaviour is not as documented - there is something wrong with the code or it does not handle a particular case appropriately.
    - Report your analysis on the relevant GitHub issue:
        - State exactly where and why the bug happens. If the bug is in the underlying C/Fortran code and you do not know how to debug this, then state the line of R code making the relevant call.
        - State the category of bug (not a bug/wishlist/confirmed bug)    
        - Add `@r-devel/triagers` to notify the triage team of your report

### `discuss fix`

Once the cause of the bug is known, there should be a discussion about how to fix it. This may require specialist expertise in programming or the methodology being implemented. If you feel equipped to comment, you can share your opinions about any proposed approach or propose your own approach. A member of R Core will need to approve a proposed approach before it should be implemented.

 - Add a comment to the relevant GitHub issue.
 - Follow the repo to be notified of any responses and respond if you have further comment, or show your reaction by adding emoji.

### `needs patch`

Once there is agreement from a member of R Core on how to fix a bug, you can implement the fix.

 - Check out the latest version of the source code of R (see further comments below)
 - Make changes to the code to implement your fix
 - Prepare a patch, that is, a file showing the differences between your code and the checked out version of the R sources
 - Test your patch
 - Add a comment to the relevant GitHub issue with your patch
 - Add `@r-devel/triagers` to notify the triage team

You can check out the R sources from the R project Subversion repository or from the GitHub mirror. If you are new to contributing, we recommend using the GitHub mirror as it requires less set up. As you become more experienced, it is advisable to use the Subversion mirror and get set up to build R locally as it will be easier to test your changes locally. The method you use to test patches will depend on the way you have checked out the R sources
 - [Instructions if you used Subversion to checkout the R sources](https://www.r-project.org/bugs.html#how-to-submit-patches)
 - Instructions if you used the GitHub mirror (TBD).

## Setup for contribution

[We can ignore bugs that are MacOS/Windows-specific]

### Use a specific version of R

Before accessing/installing the version of R specified in the bug report, you might check if your current version of R serves the purpose (allows you to reproduce the bug). Otherwise you can access/install old versions of R as detailed below

#### Access old versions of R

https://rstudio.cloud/ workspaces provide a drop-down menu where you can select major versions of R up to 6 years back from the current release version.

#### Install old versions of R

The easiest is to install from a binary - follow the link for your OS below and find the binary for the required version.

- Windows binary: https://cran.r-project.org/bin/windows/base/old/
- MacOS binary: https://cran.r-project.org/bin/macosx/
- Linux binaries: https://docs.rstudio.com/resources/install-r/

### Use the latest version of R-devel

To use the latest version of R-devel you will need to install it or build it from source. If you are new to contributing, we recommend to install from a binary or use rocker, otherwise it can take a long time to ensure you have all the prerequisites installed and to build R successfully.

#### Install R-devel

There are binaries of R-devel built daily for Windows and MacOS:

 - Windows binary: https://cran.r-project.org/bin/windows/base/rdevel.html
 - MacOS binary: https://mac.r-project.org/

#### Use rocker

TBA

#### Install from source

Full instructions to install from source are in the R manuals: https://cran.r-project.org/doc/manuals/r-release/R-admin.html. A quick version is provided in the RStudio documentation: https://docs.rstudio.com/resources/install-r-source/.




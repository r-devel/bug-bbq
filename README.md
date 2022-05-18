# Bug BBQ

Bug Barbeque (Bug BBQ) is global, online event spread over 24 hours, where members of the R community work on open bugs on R's bug-tracker: [R Bugzilla](https://bugs.r-project.org/). 
The event is open to both new and experienced contributors.

This repository is designed to coordinate the activity of participants during the event.

## Types of contribution

Open bugs will require different contributions depending on the quality of the original bug report and the action that has been taken by R Core developers or other contributors.
The Bug BBQ organizers have added issues on this repo corresponding to bugs on R Bugzilla with labels representing the required actions, as below:


| Issue Label        | Required contribution                                           | Required expertise     | Required setup                              |
|--------------------|-----------------------------------------------------------------|------------------------|---------------------------------------------|
| `needs reprex`     | Write a minimal reproducible example that demonstrates the bug  | R                      | R version specified in bug report           |
| `check in r-devel` | Check that the bug still exists in the development version of R | R                      | R-devel version                             |
| `needs diagnosis`  | Track down the cause of the bug, or identify as not a bug       | R, possibly C, Fortran | R version specified in bug report or later |
| `discuss fix`      | Add comment(s) discussion on how to fix the bug                 | R/C/Fortran/statistics/technical writing/etc  |  N/A                 |
| `needs patch`      | Implement the agreed fix and prepare a patch for review         | R, possibly C, Fortran | R source code                               |

Other: `review patch`: test/review a proposed patch?

More detail on the types of contribution is given in the sections below. For guidance on the required setup, see the next section

### `needs reprex`

A minimal reproducible example is needed when it is not clear from the report how to reproduce the bug, or the example given in the report is too complex to use for diagnosis (e.g. uses a large data set, depends on too many packages, or has too many steps not related to the bug).

 - Create an example using a standard data set, or simplify the existing example as much as possible, while still reproducing the bug.
 - Post your example as a comment on the corresponding GitHub issue, adding `@r-devel/triagers` to notify the triage team of the change.

### `check in r-devel`

A reported bug may have been fixed in a more recent release of R or in the development version ("R-devel"). So it is best to check if the bug is still an issue in R-devel before spending time on diagnosis or fixing.

 - Run the reproducible example or follow the steps outlined in the bug report in an installed version of R-devel
 - On the corresponding GitHub issue:
     - Report if the bug is still an issue in R-devel 
     - Note exact version of R-devel that you checked
     - Add `@r-devel/triagers` to notify the triage team of your report

### `needs diagnosis`

Once the 

Special cases: `not a bug` (reporter misunderstands function/documentation or there is no support from R Core to change), `wishlist` (bug report is actually a feature request)


### `discuss fix`

## Setup for contribution

Note that some bugs are OS-specific and this should be checked before trying to reproduce, diagnose or fix.

### `needs patch`



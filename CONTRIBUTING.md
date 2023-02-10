
# Contributing to GeSciLiVis
Thank you for using the GeSciLiVis package, we hope it enhances your gene research literature review, and helps you deal with all these long gene lists! Thanks also for considering a contribution – every improvement is much appreciated! The package is an open source package, which means users like you can help improve the GeSciLiVis experience. This document describes the conventions of the GeSciLiVis package, and outlines the procedure on how to propose a change to the package.


## Minor changes (e.g. fixing typos)
You can fix typos, spelling mistakes, or grammatical errors in the documentation directly on GitHub, provided it is done so in the source file. This means you’ll need to edit roxygen2 comments in the .R file, not the .Rd file.


## Substantial changes and proposing ideas
If you would like to make a substantial change, you should first file an issue and make sure someone from the development team agrees that it’s needed. If you’ve found a bug, please file an issue that illustrates the bug with a reproducible example.
We acknowledge a great potential for improving the functionalities of GeSciLiVis. If you have an idea for our new package, for example a new added feature that might improve output or functionality, please take a look at the documentation and issue list to see if it isn't included or suggested yet. If it isn’t, feel free to suggest your idea as an issue on GitHub. We promise to thoroughly review your idea or suggestion, and implement it if it helps improve the package!


### Pull request process
- Fork the package and creates a new copy of it in your repository (including all the code, branches, and commits from the original). Clone the repository on your computer. 
- Install all necassary dependencies using `devtools::install_dev_deps()`, and ensure that the package passes R CMD check by running `devtools::check()`. 
- Create a Git branch for your pull request.
- Make your changes, commit to git, and then create a pull request by using `usethis::pr_push()`.
- Please formulate the title of your  pull request briefly and and a description of your changes. Please provide as much useful information on your changes as possible to highlight the importance of your contribution.
Create pull request, the pull request should contain `Fixes #issue-number`


### Code style
- New code should align with tidyverse [style guide](https://style.tidyverse.org). 
- We would recommend to use  [roxygen2](https://cran.r-project.org/package=roxygen2), with [Markdown syntax](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd-formatting.html) for the documentation. 


### Code review
All pull requests must be reviewed by the core developer of GeSciLiVis. 


## Code of conduct
Please note that a Contributor Code of Conduct is included in the release of this package. This means that if you wish to contribute to this package, you agree to abide by the terms of the [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to GeSciLiVis you agree to abide by its terms.


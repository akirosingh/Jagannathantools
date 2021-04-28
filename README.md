# Jagannathan Lab Tools
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

![GitHub repo size](https://img.shields.io/github/repo-size/akirosingh/Jagannathantools)
![GitHub stars](https://img.shields.io/github/stars/akirosingh/Jagannathantools?style=social)
![GitHub forks](https://img.shields.io/github/forks/akirosingh/Jagannathantools?style=social)


This package contains numerous templates and tools to make life at the Jagannathan Lab happier and more efficient!

![](inst/figures/redlogo.svg)

This package allows the Project Name, PI, and Project Analyst to be stored in a ProjData.dcf file to be 
easily retrieved and used in headers and reports. 

Example of header snippet using Project Data:
```
snippet header
	###########################################
	# Project: `r jagtools::ProjectName()`
	# Author: `r jagtools::ProjectAnalyst()`
	# Date: `r paste(format(Sys.Date(), '%m/%d/%Y'))`
	# #########################################
```

There is a JAG LAB Tools project template (requires RStudio version 1.1) that sets up the project folder using the JAG LAB Tools template with ReadMe files in each folder and an option to set up a git repository. You can also save project metadata.

This package also contains functions for reading excel files with colour columns and the Table1 function.

Please feel free to file an issue request if you encounter errors or would like to request new features.

## Prerequisites

Before you begin, ensure you have met the following requirements:

<table>
<colgroup>
<col style="width: 13%" />
<col style="width: 42%" />
<col style="width: 44%" />
</colgroup>
<thead>
<tr class="header">
<th style="text-align: center;">Tool</th>
<th style="text-align: center;">How to install?</th>
<th style="text-align: center;">How to learn?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: center;"><!-- the backslash means newline --> <em>Windows only:</em><br />
Chocolately</td>
<td style="text-align: center;">Visit <a href="https://chocolatey.org/courses/installation/installing?method=installing-chocolatey">chocolatey.org</a>.</td>
<td style="text-align: center;">Chocolately installs software for you, it is installed and called from the terminal/command prompt.<br />
To open the comand prompt, press Windows+X and then click on “Command Prompt” or “Command Prompt (Admin).”</td>
</tr>
<tr class="even">
<td style="text-align: center;"><em>OS X only:</em><br />
Homebrew</td>
<td style="text-align: center;">Visit <a href="https://brew.sh">brew.sh</a>.</td>
<td style="text-align: center;">Homebrew installs software for you. It is installed and called from the terminal/command prompt.<br />
To open the terminal press Command + Space to open Spotlight and then type “Terminal” and double click on the top search result.</td>
</tr>
<tr class="odd">
<td style="text-align: center;">R</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y r.project</code><br />
<br />
<strong>OS X:</strong><br />
Use Homebrew.<br />
<code>brew install r</code><br />
</td>
<td style="text-align: center;">Read: <a href="https://r4ds.had.co.nz">R for Data Science</a></td>
</tr>
<tr class="even">
<td style="text-align: center;">Rstudio</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y r.studio</code><br />
<br />
<strong>OS X:</strong><br />
Use Homebrew (from the terminal).<br />
<code>brew cask install rstudio</code></td>
<td style="text-align: center;">Skim the <a href="https://www.rstudio.org/links/ide_cheat_sheet">cheatsheet</a></td>
</tr>
<tr class="odd">
<td style="text-align: center;">rmarkdown</td>
<td style="text-align: center;">Within Rstudio, type into the R-console:<br />
<code>install.packages(&quot;rmarkdown&quot;)</code></td>
<td style="text-align: center;">Read the <a href="https://www.rstudio.org/links/r_markdown_cheat_sheet">cheatsheet</a>. Skim <a href="https://bookdown.org/yihui/rmarkdown/">R Markdown: The Definitive Guide</a></td>
</tr>
<tr class="even">
<td style="text-align: center;">Git</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use Chocolately (from the terminal).<br />
<code>choco install -y git</code><br />
<br />
<strong>OS X:</strong><br />
Git gets installed with Homebrew.<br />
Nothing to do.</td>
<td style="text-align: center;">Read <a href="https://happygitwithr.com/git-basics.html">Part IV Git fundamentals</a> And skim the rest of <a href="https://happygitwithr.com">Happy Git and Gitub for the useR</a>.</td>
</tr>
<tr class="odd">
<td style="text-align: center;">GitHub</td>
<td style="text-align: center;">Create an account on: <a href="https://github.com/join">github.com</a><br />
And apply for <a href="https://education.github.com/benefits">Student/Researcher Benefits</a></td>
<td style="text-align: center;">Read <a href="https://happygitwithr.com/connect-intro.html">Part II Connect Git, GitHub, RStudio</a> And <a href="https://happygitwithr.com">III Early GitHub Wins</a>.</td>
</tr>
<tr class="even">
<td style="text-align: center;">Make</td>
<td style="text-align: center;"><strong>Windows:</strong><br />
Use chocolately.<br />
<code>choco install -y make</code><br />
<br />
<strong>OS X:</strong><br />
Make is preinstalled on OS X.<br />
Nothing to do.</td>
<td style="text-align: center;">Read <a href="https://kbroman.org/minimal_make/">Minimal Make</a></td>
</tr>
</tbody>
</table>

## Installing jagtools

To install jagtools, follow these steps in R:

```{r}

if(!require(devtools)){
    install.packages("devtools")
}

devtools::install_github('akirosingh/Jagannathantools')
```
## Using jagtools

To use jagtools, follow these steps:

```
<usage_example>
```

Add run commands and examples you think users will find useful. Provide an options reference for bonus points!

## Contributing to jagtools
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to jagtools, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin jagtools/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## Contributors

Thanks to the following people who have contributed to this project:
<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/emmanuella-coder"><img src="https://avatars.githubusercontent.com/u/80437695?v=4?s=100" width="100px;" alt=""/><br /><sub><b>emmanuella-coder</b></sub></a><br /><a href="#design-emmanuella-coder" title="Design">🎨</a></td>
    <td align="center"><a href="https://github.com/akirosingh"><img src="https://avatars.githubusercontent.com/u/24550000?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Adam Kirosingh</b></sub></a><br /><a href="https://github.com/akirosingh/Jagannathantools/commits?author=akirosingh" title="Code">💻</a> <a href="#ideas-akirosingh" title="Ideas, Planning, & Feedback">🤔</a> <a href="https://github.com/akirosingh/Jagannathantools/commits?author=akirosingh" title="Documentation">📖</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

<!-- people to thank here -->


## Contact

If you want to contact me you can reach me at adamsk@stanford.edu.

## License
<!--- If you're not sure which open license to use see https://choosealicense.com/--->

This project uses the following license: [MIT License](https://github.com/git/git-scm.com/blob/main/MIT-LICENSE.txt). 

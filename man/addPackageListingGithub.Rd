% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/github-functions.R
\name{addPackageListingGithub}
\alias{addPackageListingGithub}
\title{Add DESCRIPTION information from package on github.}
\usage{
addPackageListingGithub(pdb = pkgAvail(), repo, username = NULL,
  branch = "master")
}
\arguments{
\item{pdb}{Package database, usually the result of \code{\link[=pkgAvail]{pkgAvail()}} or \code{\link[=available.packages]{available.packages()}}}

\item{repo}{Character vector. Name of repository on github, e.g. \code{"RevolutionAnalytics/checkpoint"}}

\item{username}{Optional character vector. Name of repository on github, e.g. `"RevolutionAnalytics/checkpoint"``}

\item{branch}{name of branch, defaults to \code{"master"}}
}
\description{
Downloads the DESCRIPTION file from a package on github, parses the fields and adds (or replaces) a row in the available package database.
}
\examples{
# Create package database
pdb <- cranJuly2014

\dontrun{
  pdb <- pkgAvail(repos = c(CRAN = "http://mran.microsoft.com"))
  
  # Overwrite pdb with development version of miniCRAN at github
  newpdb <- addPackageListingGithub(pdb = pdb, "andrie/miniCRAN")
  newpdb["miniCRAN", ]
  
  # Add package from github that's not currently on CRAN
  newpdb <- addPackageListingGithub(pdb = pdb, repo = "RevolutionAnalytics/checkpoint")
  newpdb["checkpoint", ]
  
  set.seed(1)
  plot(makeDepGraph("checkpoint", availPkgs = newpdb, suggests = TRUE))
}
}

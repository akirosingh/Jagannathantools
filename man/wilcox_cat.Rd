% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wilcox_cat.R
\name{wilcox_cat}
\alias{wilcox_cat}
\title{Wilcox comparison within an experiment with different conditions}
\usage{
wilcox_cat(df, x_cat, y_var, condition, paired = F)
}
\arguments{
\item{df}{data}

\item{x_cat}{a categorical/discrete variable}

\item{y_var}{a continuous variable}

\item{condition}{the different experimental conditions in an experiment like Stim}
}
\value{

}
\description{
Wrapper-function to do a wilcox test across multiple conditions (Think Stim conditions)
}
\author{
akirosingh
}

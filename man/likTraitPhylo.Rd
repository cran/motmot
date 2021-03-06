% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/likTraitPhylo.R
\name{likTraitPhylo}
\alias{likTraitPhylo}
\title{Log-likelihood estimation for traits and phylogenies}
\usage{
likTraitPhylo(y, phy, covPIC = TRUE, brCov = NULL)
}
\arguments{
\item{y}{A matrix of trait data. Rownames must be included and match the taxon names in the phylogeny. Can accept single traits (calculates variance) or multiple traits (calculates variance-covariance matrix).}

\item{phy}{An object of class "phylo" (see \pkg{ape}).}

\item{covPIC}{Logical - allow for covariance between multivariate traits (\code{TRUE}), or assume not covariance (\code{FALSE}). Only applicable to multivariate traits}

\item{brCov}{If \code{NULL} (the default), Brownian covariance is analytically estimated. If a user-supplied numerical value is suppied the likelihood is calculate given this value}
}
\value{
brownianVariance Brownian variance (or covariance for multiple traits) given the data and phylogeny

logLikelihood The log-likelihood of the model and data
}
\description{
This function calculates the log-likelihood and Brownian (co)variance for a trait(s) and a phylogeny using phylogenetically independent contrasts
Note that \code{as.rateMatrix} calls the CAIC function \code{vcv.array} multiple times and this can be slow for large phylogenies (though faster than using the "ape" equivalent \code{vcv.phylo}).
}
\details{
The \code{phylo} object must be rooted and fully dichotomous
}
\examples{
data(anolis.tree)
data(anolis.data)
## calculate Brownian variance log-likelihood of female SVL
female.svl <- matrix(anolis.data[,"Female_SVL"], 
dimnames=list(rownames(anolis.data)))
input.data <- sortTraitData(phy=anolis.tree, y=female.svl, log.trait=TRUE)
likTraitPhylo(phy = input.data$phy, y=input.data$trait)
}
\references{
Felsenstein J. 1973. Maximum-likelihood estimation of evolutionary trees from continuous characters. Am. J. Hum. Genet. 25, 471-492.

Felsenstein J. 1985. Phylogenies and the comparative method. American Naturalist 125, 1-15.

Freckleton RP & Jetz W. 2009. Space versus phylogeny: disentangling phylogenetic and spatial signals in comparative data. Proc. Roy. Soc. B 276, 21-30.
}
\author{
Gavin Thomas, Rob Freckleton
}

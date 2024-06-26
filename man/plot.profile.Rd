% file MASS/man/plot.profile.Rd
% copyright (C) 1999-2023 W. N. Venables and B. D. Ripley
%
\name{plot.profile}
\alias{plot.profile}
\alias{pairs.profile}
\title{Plotting Functions for 'profile' Objects}
\description{
  \code{\link{plot}} and \code{\link{pairs}} methods for objects of
  class \code{"profile"}.
}
\usage{
\method{plot}{profile}(x, ...)
\method{pairs}{profile}(x, colours = 2:3, ...)
}
\arguments{
  \item{x}{an object inheriting from class \code{"profile"}.}
  \item{colours}{Colours to be used for the mean curves conditional on
    \code{x} and \code{y} respectively.}
  \item{\dots}{arguments passed to or from other methods.}
}
\details{
  This is the main \code{plot} method for objects created by
  \code{\link{profile.glm}}.  It can also be called on objects created
  by \code{\link{profile.nls}}, but they have a specific method,
  \code{\link{plot.profile.nls}}.

  The \code{pairs} method shows, for each pair of parameters x and
  y, two curves intersecting at the maximum likelihood estimate, which
  give the loci of the points at which the tangents to the contours of
  the bivariate profile likelihood become vertical and horizontal,
  respectively.  In the case of an exactly bivariate normal profile
  likelihood, these two curves would be straight lines giving the
  conditional means of y|x and x|y, and the contours would be exactly
  elliptical.
}
\author{
  Originally, D. M. Bates and W. N. Venables.  (For S in 1996.)
}
\seealso{
  \code{\link{profile.glm}}, \code{\link{profile.nls}}.
}
\examples{
## see ?profile.glm for an example using glm fits.

## a version of example(profile.nls) from R >= 2.8.0
fm1 <- nls(demand ~ SSasympOrig(Time, A, lrc), data = BOD)
pr1 <- profile(fm1, alphamax = 0.1)
MASS:::plot.profile(pr1)
pairs(pr1) # a little odd since the parameters are highly correlated

## an example from ?nls
x <- -(1:100)/10
y <- 100 + 10 * exp(x / 2) + rnorm(x)/10
nlmod <- nls(y ~  Const + A * exp(B * x), start=list(Const=100, A=10, B=1))
pairs(profile(nlmod))
}
\keyword{models}
\keyword{hplot}

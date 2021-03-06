% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/NVU-RSBN.R
\name{corrPlanRSBN}
\alias{corrPlanRSBN}
\title{RSBN course correction(s) for a flight plan}
\usage{
corrPlanRSBN(plan, bcLeg = NULL, dlim = 150, cols = c("fix", "fixLat",
  "fixLon", "ZPY"))
}
\arguments{
\item{plan}{A flight plan, as a data.frame. Plans created with \code{\link{planNVU}(..., merge=TRUE)}
are accepted as input. At a minimum, the data frame.should have four columns:
waypoint names, latitudes, longitudes and ZPY (NVU course). The latter is needed to indirectly
identify the NVU legs, which may not correspond 1:1 to the legs of the flight plan (see
\code{points=} in \code{\link{planNVU}}).}

\item{bcLeg}{A named list of flight plan legs to be corrected by each RSBN beacon. Each list element
should be a vector of flight plan legs, specified either as numbers or as initial fixes, and named
after the beacon ID that should be used for correction. Because RSBN beacon IDs are not always unique,
optionally append the two digits of the channel number to the ID in order to specify the desired beacon.

If \code{bcLeg=NULL}, all beacons that lie a distance of \code{dlim} kilometers from the flight path
are used to correct each segment.}

\item{dlim}{Use all beacons that lie \code{dlim} kilometers from the flight path, if \code{bcLeg=NULL}.}

\item{cols}{An optional vector of column names, if these are named differently in \code{plan}}
}
\value{
A data.frame of leg-correction pairs. Each row contains the flight plan leg number, start and
end fix, the name, ID and channel of the RSBN beacon, and the correction parameters (Zm, Sm and YK), i.e.
columns \code{Leg}, \code{From}, \code{To}, \code{beaconName}, \code{bcID}, \code{bcChannel}, \code{Zm},
\code{Sm} and \code{YK}.
}
\description{
This function returns the NVU course correction parameters (Zm, Sm, YK)  for the various
legs of a flight plan.
}
\examples{
# Create a flight plan from Moscow (Sheremetyevo) to Tashkent
plan <- planRoute("UUEE", "UTTT", "DK", "DODUR")

# Calculate the data for the NVU
plan <- planNVU(plan, c("UUEE", "DK", "FV", "QL", "UWPP", "OG", "URL",
                        "KEKUN", "EL", "NKZ", "MIKNO", "DODUR", "UTTT"),
                init.mag=TRUE, merge=TRUE)

# Get data for all RSBNs close to each waypoints
RSBNs <- corrPlanRSBN(plan)

}

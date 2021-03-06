#' Returns a copy of the internal flight data.
#'
#' This function returns a copy of the airport, airway, navaid and navfix data that
#' are included internally in the package. These have been parsed into .RData format
#' from the data files that ship with FlightGear (version 3.4), using the function 
#' \code{parseFlightData} that is included in the package source. They are used in 
#' almost all functions in the rfgfs package.
#'
#' @return A list of data.frames:
#' \describe{
#'  \item{awy}{Airways}
#'  \item{fix}{Navfixes}
#'  \item{nav}{Another list of data.frames, corresponding to the various navaid types:
#'              "NDB", "VORDME", "ILS", "LOC", "GS", "OM", "MM", "IM", "DMEILS", "TACAN".}
#'  \item{pts}{All points ("nodes") that are part of the airways network.}
#'  \item{dists}{Edge distances in the airways network.}
#'  \item{apt}{Airport information (name, ICAO code, latitude, longitude and elevation).}
#' }
#'
#' @export
flightData <- function() {
    fltData
}

 

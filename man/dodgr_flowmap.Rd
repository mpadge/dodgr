% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flowmap.R
\name{dodgr_flowmap}
\alias{dodgr_flowmap}
\title{dodgr_flowmap}
\usage{
dodgr_flowmap(net, bbox = NULL, linescale = 1)
}
\arguments{
\item{net}{A street network with a \code{flow} column obtained from
\link{dodgr_flows_aggregate} or \link{dodgr_flows_disperse}}

\item{bbox}{If given, scale the map to this bbox, otherwise use entire extend
of \code{net}}

\item{linescale}{Maximal thickness of plotted lines}
}
\description{
Map the output of \link{dodgr_flows_aggregate} or \link{dodgr_flows_disperse}
}
\note{
\code{net} should be first passed through \code{merge_directed_graph}
prior to plotting, otherwise lines for different directions will be overlaid.
}
\examples{
graph <- weight_streetnet (hampi)
from <- sample (graph$from_id, size = 10)
to <- sample (graph$to_id, size = 5)
to <- to [!to \%in\% from]
flows <- matrix (10 * runif (length (from) * length (to)),
                 nrow = length (from))
graph <- dodgr_flows_aggregate (graph, from = from, to = to, flows = flows)
# graph then has an additonal 'flows` column of aggregate flows along all
# edges. These flows are directed, and can be aggregated to equivalent
# undirected flows on an equivalent undirected graph with:
graph_undir <- merge_directed_graph (graph)
\dontrun{
dodgr_flowmap (graph_undir)
}
}

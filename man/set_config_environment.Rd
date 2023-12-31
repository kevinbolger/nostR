% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{set_config_environment}
\alias{set_config_environment}
\title{Set up the config environment for the session}
\usage{
set_config_environment(
  api_base_url,
  private_key,
  relays = c("wss://nos.lol", "wss://nostr.bitcoiner.social", "wss://relay.damus.io")
)
}
\arguments{
\item{api_base_url}{The base url path of the nostr api}

\item{private_key}{the users private key}

\item{relays}{relays to be used when calling the api}
}
\value{
True if successful.
}
\description{
Set up the config environment for the session
}

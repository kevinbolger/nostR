#' Setting environment to store configuration details for the session
config_env <- new.env()


#' Set up the config environment for the session
#'
#' @param api_base_url The base url path of the nostr api
#' @param private_key the users private key
#' @param relays relays to be used when calling the api
#'
#' @return True if successful.
#' @export
set_config_environment <- function(api_base_url,
                            private_key,
                            relays = c("wss://nos.lol",
                                       "wss://nostr.bitcoiner.social",
                                       "wss://relay.damus.io")) {
  config_env$api_base_url <- api_base_url
  config_env$private_key <- private_key
  config_env$relays <- check_values(relays)
  return(TRUE)
}

#' Single values conform to list
#'
#' If a single string value is provided, convert it to a list.
#' Else, return the original list.
#'
#' @param value A list of relays
#'
#' @return True if valid
#'
check_values <- function(value) {

  if (length(value) == 1) {
    return(list(value))
  } else {
    return(value)
  }
}

#' Verify api config succesful
#'
#' @return True if successful.
#' @export
verify_api_config_success <- function(){

  # Construct the URL for the API endpoint
  url <- paste0(config_env$api_base_url, "/v0/verify")

  # Define the body of the request as a list
  body <- list("relays" = c(config_env$relays),
               "private_key" = c(config_env$private_key)
  )

  http_post_result <- send_post_request(url, body)

  # Return True if succesfuly
  return(TRUE)
}

#' Util function for sending post requests
#'
#' @param url Endpoint URL
#' @param body The body of the post request
#' @importFrom jsonlite toJSON
#' @importFrom httr2 request req_method req_body_raw req_headers req_perform
#' @return True if successful.
send_post_request <- function(url, body){
  # Manually encode the body as a JSON string
  body_json <- jsonlite::toJSON(body, auto_unbox = TRUE)

  req <- httr2::request(url)
  req <- httr2::req_method(req, "POST")
  req <- httr2::req_body_raw(req, body_json)
  req <- httr2::req_headers(req, `Content-Type` = "application/json")

  # Make the POST request and store the result
  http_post_result <- httr2::req_perform(req)

  return(http_post_result)
}

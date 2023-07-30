#' Notes from a user
#'
#' Looks up notes posted by a user.
#'
#' @param authors A list of the nostr npub's or hex's of an author.
#' @return Result stored in json format
#' @export
fetch_user_notes <- function(authors = NA, event_refs = NA, pubkey_refs = NA,
                             since = NA, until = NA, limit = NA ) {

  authors <- check_values(authors)
  event_refs <- check_values(event_refs)
  pubkey_refs <- check_values(pubkey_refs)

  # Construct the URL for the API endpoint
  url <- paste0(config_env$api_base_url, "/v0/fetch/notes")

  # Define the body of the request as a list
  body <- list("relays" = c(config_env$relays),
               "authors" = c(authors),
               "event_refs" = c(event_refs),
               "pubkey_res" = c(pubkey_refs),
               "since" = since,
               "until" = until,
               "limit" = limit)

  http_post_result <- send_post_request(url, body)

  # Parse the JSON response and store the result
  json_result <- httr2::resp_body_json(http_post_result)


  # Return the result
  return(json_result)
}

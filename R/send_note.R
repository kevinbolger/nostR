#' Send a note
#'
#' Allows the owner of a nostr public id to publish a note.
#'
#' @param note The message to post to the note.
#' @return True if succesful
#' @export
send_user_note <- function(text) {
  # Construct the URL for the API endpoint
  url <- paste0(config_env$api_base_url, "/v0/send/note")

  # Define the body of the request as a list
  body <- list("text" = c(text),
               "private_key" = c(config_env$private_key),
               "relays" = c(config_env$relays)
  )

  http_post_result <- send_post_request(url, body)

  # Return True if succesfuly
  return(TRUE)
}

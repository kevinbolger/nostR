#' Send a direct note to another user
#'
#' Allows the user to send a direct message to another nostr id
#'
#' @param text The message to post to the note.
#' @param recipient_public_key The public id associated with the user.
#' @export
send_user_dm <- function(text, recipient_public_key) {

  # Construct the URL for the API endpoint
  url <- paste0(config_env$api_base_url, "/v0/send/dm")

  # Define the body of the request as a list
  body <- list("relays" = c(config_env$relays),
                "sender_private_key" = c(config_env$private_key),
                "recipient_public_key" = c(recipient_public_key),
                "text" = c(text)
  )

  http_post_result <- send_post_request(url, body)

  # Return True if succesfuly
  return(TRUE)
}

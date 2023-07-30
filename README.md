# nostR R Package

## About

This package is a wrapper for the NSA API which aims to provide an open-source, serverless API for retrieving data from nostr relays, similar to how the Twitter API allows users to access Twitter data (but without the fees!).

## Useage

### Accessing the API

#### Use an existing API Endpoint

The `API` that this package wraps around is an open-source project. If you have the `url` for an existing implementation of this `API`, then you can use that. When using `set_config_environment` set the `api_base_url` to this value.

#### Deploying your own API Endpoint

The open source project with instructions on how to deploy your own serverless `API` can be found [here](https://github.com/garyokeeffe/NSA).

### Configuration

When using the package in a fresh environment, be sure to first user the `set_config_environment` function. The first argument is the `api_base_url` and the second is the `relays`. `relays` has a default value and is optional to change. 

### Sample

```R
base_url <- "url_of_API_deployment"
private_key <- "some_user_private_key"
# Deploy url using instructions [here](https://github.com/garyokeeffe/NSA).

nostR::set_config_environment(api_base_url = base_url, private_key = private_key)

authors <- c('some_users_npub')
results <- nostR::user_notes(authors = authors)
View(results)
```

## Developing on the project

After cloning the repo, open the project file in `RStudio`. Ensure you have the `renv` package installed then run `renv::restore()` to install the dependencies for the project via the lockfile.

If making any changes, ensure the lockfile is up to date by running `renv::snapshot()`.

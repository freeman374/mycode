# The following example shows how to issue an HTTP GET request supplying
# an optional request header.
data "http" "iss" {
  url = "http://api.open-notify.org/astros.json"      // API to send HTTP GET to
  #url = "https://pokeapi.co/api/v2/pokemon/pikachu"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }
}


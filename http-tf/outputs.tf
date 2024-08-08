locals {
    # get json 
    my_data = jsondecode(data.http.iss.response_body)

    # get all users
    person_name = [for person in local.my_data.people : person.name]
}

output "person_name" {
   description = "Person name"
    value = local.person_name
}


# produces an output value named "space_heroes"
output "space_heroes" {
  description = "API that documents folks in space"
  value       = data.http.iss.response_body
}

# produces legal JSON output value named "space_heroes_json"
output "space_heroes_json" {
  description = "API that documents folks in space"
  value       = jsondecode(data.http.iss.response_body)    // note the jsondecode()
} 



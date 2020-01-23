# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
# Ship.create(name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire")
# Ship.create(name: 'Serenity', ship_class: 'Firefly', location: "Miranda")
ship_attributes = [
  {
    name: 'Millenial Falcon', ship_class: "Galaxy", location: "A Galaxy Far Far Away"
  },
  {
    name: 'USS Enterprise', ship_class: 'Galaxy', location: "Romulan Star Empire"
  },
  {
    name: 'Serenity', ship_class: 'Firefly', location: "Miranda"
  }

]

ship_attributes.each do |attributes|
  Starship.create(attributes)
end

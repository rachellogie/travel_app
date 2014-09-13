def create_trip(country)
  Trip.create(country_id: country.id, name: country.name)
end
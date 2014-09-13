def create_trip(country, user)
  user.trips.create(country_id: country.id, name: country.name)
end
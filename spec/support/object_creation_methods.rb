def create_trip(country, user, visited=false)
  user.trips.create!(country_id: country.id, name: country.name, visited: visited)
end
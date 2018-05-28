url = "https://api.teleport.org/api/urban_areas/"
major_cities = RestClient.get(url)
cities_hash = JSON.parse(major_cities)
cities_list_arr = cities_hash["_links"]["ua:item"]

cities_list_arr.each do |city|
  city_unparsed = RestClient.get("#{city['href']}")
  city_hash = JSON.parse(city_unparsed)
  country = city_hash["_links"]["ua:countries"][0]["name"]
  continent = city_hash["_links"]["ua:continent"]["name"]
  Place.create(city: city["name"], country: country, continent: continent)
end


cities_list_arr.each do |city|
  photos_unparsed = RestClient.get("#{city['href']}images")
  photos_hash = JSON.parse(photos_unparsed)
  img_url = photos_hash["photos"][0]["image"]["web"]
  Photo.create(url: img_url, place_id: Place.find_by(city: city["name"]).id)
end

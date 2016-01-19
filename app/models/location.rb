class Location

  def self.find_locations(categories, address, distance)
    locations = {}
    address = Location.default_addess(address)
    distance_in_meters = Location.miles_to_meters(distance)
    categories.each do |category, v|
      if category == "events"
        locations[:Event] = EventbriteService.new.find_event(address, distance)
      else
        readable_category = category.split("_").map(&:capitalize).join(" ").singularize
        locations[readable_category] = YelpService.new.find_location(category, address, distance_in_meters)
      end
    end
    # binding.pry
    locations
  end

  def self.location_details(id)
    YelpService.new.location_details(id)
  end

  def self.yelp_image_name(location)
    location.image_url.gsub('ms.jpg', 'o.jpg')
  end

  def self.address(location)
    location.location.display_address.first
  end

  def self.default_addess(address)
    # coordinates = { latitude: 37.7577, longitude: -122.4376 }
    if address == ""
      address = 'Denver'
    end
    address
  end

  def self.miles_to_meters(distance)
    distance = distance.to_i / 0.00062137
  end

end

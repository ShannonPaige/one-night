class Location

  def self.find_locations(categories, address, distance)
    locations = {}
    address = Location.default_addess(address)
    categories.each do |category, v|
      if category == "events"
        locations[:Event] = Event.find_event(address, distance)
      else
        distance = Location.miles_to_meters(distance)
        readable_category = category.split("_").map(&:capitalize).join(" ").singularize
        locations[readable_category] = Yelp.client.
                                            search(address, {category_filter: category,
                                                                limit: 20, radius_filter: distance}).
                                            businesses.
                                            shuffle.
                                            first
      end
    end
    locations
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

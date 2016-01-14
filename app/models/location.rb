class Location

  def self.find_locations(params)
    locations = {}
    params.each do |category, v|
      if category == "events"
        locations[:Event] = Event.find_event
      else
        readable_category = category.split("_").map(&:capitalize).join(" ").singularize
        locations[readable_category] = Yelp.client.
                                            search('Denver', {  category_filter: category,
                                                                limit: 20 }).
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

end

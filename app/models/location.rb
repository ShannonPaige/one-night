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

end

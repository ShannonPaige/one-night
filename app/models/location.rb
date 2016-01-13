class Location

  def self.find_locations(params)
    locations = params.map do |category, v|
      Yelp.client.search('Denver', { category_filter: category, limit: 1 })
    end
  end

end

class YelpService
  attr_reader :yelp_client

  def initialize
    @yelp_client ||= Yelp.client
  end

  def find_location(category, address, distance_in_meters)
    @yelp_client.search(address, { category_filter: category,
                                  limit: 20, radius_filter: distance_in_meters})
                .businesses.shuffle.first
  end

  def location_details(id)
    @yelp_client.business(id).business
  end
end

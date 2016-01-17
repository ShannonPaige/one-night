class EventbriteService
  # attr_reader :eventbrite_client

  def initialize
    @eventbrite_client ||= EventbriteApiClient.new(auth_token: ENV["eventbrite_token"])
  end

  def find_event(address, distance)
    distance = distance + "mi"
    event_response = @eventbrite_client.events
                                        .search
                                        .get('location.address' => address,
                                              'location.within' => distance,
                                              'categories' => '103,104,105,106,108,110,116,119')
    event_response.parsed_response["events"].shuffle.first
  end
end

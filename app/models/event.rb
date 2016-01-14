class Event

  def self.eb_api_client
    EventbriteApiClient.new(auth_token: ENV["eventbrite_token"])
  end

  def self.find_event
    event_response = eb_api_client.events.search.get('venue.city' => 'Denver')
    event_response.parsed_response["events"].shuffle.first
  end

end

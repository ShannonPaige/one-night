class LocationsController < ApplicationController
  def index
    # parameters = { term: params[:term], limit: 16 }
    @locations =  Yelp.client.search('Denver', { term: 'bars', limit: 2 })
  end
end

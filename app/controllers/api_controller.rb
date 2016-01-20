class ApiController < ApplicationController
  respond_to :json

  def index
    if params[:location_categories]
      @locations = Location.find_locations(params[:location_categories], params[:address], params[:distance])
      respond_with @locations
    else
      flash[:error] = "You must choose at least one category."
      redirect_to search_path
    end
  end
end

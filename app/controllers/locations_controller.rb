class LocationsController < ApplicationController
  before_action :require_current_user

  def index
    if params[:location_categories]
      @locations =  Location.find_locations(params[:location_categories], params[:address], params[:distance])
    else
      flash[:error] = "You must choose at least one category."
      redirect_to search_path
    end
  end

    def show
      @category = params[:category]
      @location = Location.location_details(params[:id])
    end
end

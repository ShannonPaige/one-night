class LocationsController < ApplicationController
  def index
    parameters = params[:location_categories]
    @locations =  Location.find_locations(parameters)
  end

  private

    # def location_params
    #   params.permit(:location_categories)
    # end
end

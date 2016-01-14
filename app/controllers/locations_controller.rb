class LocationsController < ApplicationController
  def index
    # parameters = params[:location_categories]
    if params[:location_categories]
      @locations =  Location.find_locations(params[:location_categories])
    else
      flash[:error] = "You must choose at least one category."
      redirect_to search_path
    end
  end

  private

    # def location_params
    #   params.permit(:location_categories)
    # end
end

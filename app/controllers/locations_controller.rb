class LocationsController < ApplicationController
  def index
    if params[:location_categories]
      @locations =  Location.find_locations(params[:location_categories], params[:address], params[:distance])
    else
      flash[:error] = "You must choose at least one category."
      redirect_to search_path
    end

    def show
      @category = params[:category]
      @location = Location.find_location(params[:id])
    end
  end

  private

    # def location_params
    #   params.permit(:location_categories)
    # end
end

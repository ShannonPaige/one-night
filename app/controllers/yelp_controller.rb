class YelpController < ApplicationController
  respond_to :json

  def index
    if params[:location_categories]
      render json: Location.find_locations(params[:location_categories], params[:address], params[:distance])
    else
      flash[:error] = "You must choose at least one category."
      redirect_to search_path
    end
  end
end

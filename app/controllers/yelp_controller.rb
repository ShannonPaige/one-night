class YelpController < ApplicationController
  respond_to :json

  def show
    respond_with YelpService.new
  end
end

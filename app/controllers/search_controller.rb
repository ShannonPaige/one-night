class SearchController < ApplicationController
  before_action :require_current_user

  def index
    @address = params[:address]
    @locations = []
  end
end

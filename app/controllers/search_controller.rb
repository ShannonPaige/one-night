class SearchController < ApplicationController
  before_action :require_current_user

  def index
    @locations = []
  end
end

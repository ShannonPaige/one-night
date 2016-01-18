class UsersController < ApplicationController
  before_action :require_current_user

  def show
    @favorites = current_user.favorites
  end
end

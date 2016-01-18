class FavoritesController < ApplicationController
  before_action :require_current_user

#to do figure out why it's sending to index and send it to create instead
  # def index
  #   @api_id = params[:id]
  #   @category = params[:category]
  #   favorite = Favorite.find_or_create_fave(params[:id], params[:category])
  #   UserFavorite.add_to_faves(current_user, favorite)
  #   binding.pry
  #   redirect_to profile_path
  # end

  def create
    @api_id = params[:id]
    @category = params[:category]
    favorite = Favorite.find_or_create_fave(params[:id], params[:category], params[:name], params[:image_url], params[:address])
    UserFavorite.add_to_faves(current_user, favorite)
    @favorites = current_user.favorites
    redirect_to profile_path
  end
end

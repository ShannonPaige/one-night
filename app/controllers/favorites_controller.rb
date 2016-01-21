class FavoritesController < ApplicationController
  before_action :require_current_user

  def create
    @api_id = params[:id]
    @category = params[:category]
    favorite = Favorite.find_or_create_fave(params[:id], params[:category], params[:name], params[:image_url], params[:address])
    binding.pry
    UserFavorite.add_to_faves(current_user, favorite)
    @favorites = current_user.favorites
    redirect_to profile_path
  end
end

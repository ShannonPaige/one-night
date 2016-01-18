class UserFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favorite

  def self.add_to_faves(user, favorite)
    UserFavorite.create(user_id: user.id, favorite_id: favorite.id)
  end


end

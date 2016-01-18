class Favorite < ActiveRecord::Base
  has_many :user_favorites
  has_many :users, through: :user_favorites

  def self.find_or_create_fave(api_id, category)
    Favorite.find_or_create_by(api_id: api_id, category: category)
  end

end

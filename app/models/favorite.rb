class Favorite < ActiveRecord::Base
  has_many :user_favorites
  has_many :users, through: :user_favorites

  def self.find_or_create_fave(api_id, category, name, image_url, address)
    favorite = Favorite.find_or_create_by(api_id: api_id)
    image = Location.yelp_image_name(image_url)
    favorite.update_attribute(:category, category)
    favorite.update_attribute(:name, name)
    favorite.update_attribute(:image_url, image_url)
    favorite.update_attribute(:address, address)
    favorite
  end

end

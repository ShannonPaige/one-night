class Favorite < ActiveRecord::Base
  has_many :user_favorites
  has_many :users, through: :user_favorites

  def self.find_or_create_fave(api_id, category, name, image_url, address)
    Favorite.find_or_create_by( api_id: api_id,
                                category: category,
                                name: name,
                                image_url: image_url,
                                address: address)
  end

end

class User < ActiveRecord::Base
  has_many :user_favorites
  has_many :favorites, through: :user_favorites

  def self.find_or_create_from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  # def grab_favorites
  #   user_faves = {}
  #   self.favorites.each do |favorite|
  #   end
  #   user_faves
  # end

end

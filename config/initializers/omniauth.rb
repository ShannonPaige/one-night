Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['twitter_api'], ENV['twitter_api_secret']
end

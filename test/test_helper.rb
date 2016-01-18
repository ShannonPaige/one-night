ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "capybara/rails"
require "mocha/mini_test"
require "minitest/pride"
require "simplecov"
#require 'webmock'
#require 'vcr'

SimpleCov.start "rails"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # VCR.configure do |config|
  #   config.cassette_library_dir = 'test/cassettes'
  #   config.hook_into :webmock
  # end
end

class ActionController::TestCase
  def create_auth_info
    auth_info = OmniAuth::AuthHash.new({
                'uid' => '12345',
                'extra' => { 'raw_info' => { 'name' => 'Shannon', 'screen_name' => 'spaige'}},
                'credentials' => {'token' => '67', 'secret' => '89' }
            })
    SessionsController.any_instance.stubs(:auth_info).returns(auth_info)
  end

  def stub_omniauth
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Shannon",
          screen_name: "spaige",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end

  def create_user
    stub_omniauth
    user = stub(:name => "Shannon",
                :screen_name => "spaige",
                :uid => 1234,
                :oauth_token => "pizza",
                :oauth_token_secret => "secretpizza")
    fave = stub(:name => "That Place",
                :address => "123 Sesame Street",
                :api_id => 5678,
                :image_url => "http://image.com",
                :category => "Things")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    ApplicationController.any_instance.stubs(:favorites).returns([fave])
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    Capybara.app = OneNight::Application
    OmniAuth.config.test_mode = true
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "Shannon",
          screen_name: "spaige",
        }
      },
      credentials: {
        token: "pizza",
        secret: "secretpizza"
      }
    })
  end

  def create_user
    stub_omniauth
    user = stub(:name => "Shannon",
                :screen_name => "spaige",
                :uid => 1234,
                :oauth_token => "pizza",
                :oauth_token_secret => "secretpizza")
    ApplicationController.any_instance.stubs(:current_user).returns(user)
  end

  def teardown
    OmniAuth.config.mock_auth[:twitter] = nil
    reset_session!
  end

end

DatabaseCleaner.strategy = :transaction

class Minitest::Spec
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end
end

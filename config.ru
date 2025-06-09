require_relative "config/environment"

use Rack::Session::Cookie, secret: ENV['SESSION_SECRET'] || 'some_default_dev_secret'

use OmniAuth::Builder do
  provider :line,
           ENV['LINE_CHANNEL_ID'],
           ENV['LINE_CHANNEL_SECRET'],
           scope: 'profile openid',
           redirect_uri: ENV['LINE_REDIRECT_URI'] || 'http://localhost:3000/auth/line/callback'
end

run Rails.application
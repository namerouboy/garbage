require_relative "boot"

require "rails/all"

# 環境変数を必ず読み込む
require "dotenv/load"

Bundler.require(*Rails.groups)

module Garbage
  class Application < Rails::Application
    config.eager_load_paths << Rails.root.join('app', 'models')
    config.load_defaults 8.0
    config.api_only = false

    config.autoload_lib(ignore: %w[assets tasks])
  end
end
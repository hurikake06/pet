require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pet
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    Rails.application.config.assets.paths << Rails.root.join('vendor', 'lib')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'images')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'javascripts')
    Rails.application.config.assets.paths << Rails.root.join('vendor', 'stylesheets')
    Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif )
  end
end

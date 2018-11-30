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

    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "animate.css")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "bootstrap", "dist", "css")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "bootstrap", "dist", "js")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "components-font-awesome", "css")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "desandro-matches-selector")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "et-line-font")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "ev-emitter")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "fizzy-ui-utils")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "flexslider")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "flexslider", "jquery.flexslider")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "get-size")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "imagesloaded")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "isotope", "dist")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "jquery.mb.ytplayer", "dist")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "magnific-popup", "dist")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "masonry", "dist")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "outlayer")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "owl.carousel", "dist")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "owl.carousel", "dist", "assets")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "simple-text-rotator")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "skrollr", "src")
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "wow")    
    Rails.application.config.assets.paths << Rails.root.join("vendor", "assets", "lib", "wow", "dist")
  end
end

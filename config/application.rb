require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bus
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.autoload_paths += Dir[Rails.root.join('app', 'models', '{**/}')]
    config.autoload_paths << Rails.root.join('lib')
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    config.i18n.locale = 'zh-CN'
    config.i18n.default_locale = 'zh-CN'
    config.encoding = "utf-8"
    config.generators do |g|
      # g.template_engine nil #to skip views
      g.test_framework  nil #to skip test framework
      g.assets  false
      # g.helper false
      g.stylesheets false
    end
    # config.active_support.escape_html_entities_in_json = true
    # config.active_record.raise_in_transactional_callbacks = true # >=rails4.2 only
    config.app_generators.scaffold_controller :scaffold_controller
  end
end

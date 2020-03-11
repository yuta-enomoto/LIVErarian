require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LIVErarian
  class Application < Rails::Application
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
    config.i18n.default_locale = :ja
    config.generators do |g|
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local 
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework false
    
    end
  end
end


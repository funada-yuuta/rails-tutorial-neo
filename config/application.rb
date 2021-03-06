require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 6.1

    config.time_zone = "Tokyo"
    # config.eager_load_paths << Rails.root.join("extras")

    config.generators.system_tests = nil

    config.generators do |g|
      g.assets false
      g.skip_routes false
      g.test_framework :rspec,
        view_specs: false,
        routing_specs: false
    end

    #test.rbでは:enにしている(テストがしにくいため)
    config.i18n.default_locale = :en #:ja
    config.active_record.default_timezone = :local

    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end

require File.expand_path('../boot', __FILE__)

HaveYouBeenTo = Module.new

class HaveYouBeenTo::Application < Rails::Application
  config.cache_classes = false
  config.eager_load = false
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false
  config.active_support.deprecation = :log
  config.assets.debug = true
  assets.register_engine '.haml', Tilt::HamlTemplate
  # config.action_mailer.raise_delivery_errors = false
  # config.active_record.migration_error = :page_load
end

HaveYouBeenTo::Application.initialize!

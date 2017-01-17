# Defines Hash.deep_symbolize_keys
require 'i18n/core_ext/hash'

config_file = Rails.root.join("config", "app_config.yml.erb")
# Allow ERB into your YAML
APP_CONFIG = YAML::load(ERB.new(IO.read(config_file)).result)[Rails.env].deep_symbolize_keys

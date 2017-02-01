# Defines Hash.deep_symbolize_keys
require 'i18n/core_ext/hash'
APP_CONFIG = ConferenceCommander::Application.config_for(:app_config).deep_symbolize_keys

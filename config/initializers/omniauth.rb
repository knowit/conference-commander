# You will need to configure OmniAuth to use your crowd authentication (ref https://github.com/robdimarco/omniauth_crowd)
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :crowd,
    crowd_server_url: APP_CONFIG[:crowd][:url],
    application_name: APP_CONFIG[:crowd][:app_name],
    application_password: APP_CONFIG[:crowd][:app_password]
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

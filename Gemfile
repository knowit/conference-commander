source 'https://rubygems.org'

ruby '2.4.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.0'
# Postgres
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Load environment variables from .env
gem 'dotenv-rails'
gem 'semantic-ui-sass', git: 'https://github.com/doabit/semantic-ui-sass.git'
gem 'slim'
# gem 'simple_form', '~> 3.4.0'
gem 'simple_form', git: 'https://github.com/elsurudo/simple_form.git', branch: 'rails-5.1.0'
gem 'responders'
gem 'font-awesome-rails'
#gem 'bower-rails', '~> 0.11.0'
gem 'webpacker'

gem 'gretel'

# Awesome print, for awesome printing!
gem 'awesome_print'

# slim
gem 'slim-rails'

# Authorization
gem 'cancancan'

# Netsed associations
gem 'cocoon'

# Wizard
gem 'wicked'

# Encryption
gem 'attr_encrypted'

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-fileupload-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Crowd
# https://github.com/robdimarco/omniauth_crowd
gem 'omniauth', '>= 1.0.0'  # We depend on this
gem 'omniauth_crowd'

gem 'paperclip'

# Deploy
gem 'capistrano-rails', group: :development
gem 'capistrano-rvm'
gem 'capistrano-bundler'
gem 'capistrano3-puma'
gem 'airbrussh', require: false

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'annotate'
  # Generates ER Diagram: `bundle exec erd`
  gem 'rails-erd'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

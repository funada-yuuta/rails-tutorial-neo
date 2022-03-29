source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# 'rails', '~> 6'と入力すれば、rails6の最新版を取得できる
gem 'rails', '~> 6.1.5'
gem 'aws-sdk-s3', require: false
gem 'image_processing'
gem 'mini_magick'
gem 'active_storage_validations'
gem 'bootstrap-sass'
gem 'faker'
gem 'will_paginate'
gem 'bootstrap-will_paginate'
gem 'mysql2', '~> 0.5'
gem 'puma', '~> 5.0'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# gem 'image_processing', '~> 1.2'

gem 'bootsnap', '>= 1.4.4', require: false

# Rails Tutorial Neo
gem 'devise'
gem 'omniauth'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Rails Tutorial Neo
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 4.1.0'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  gem 'spring'

  # Rails Tutorial Neo
  gem 'dotenv-rails'
end

# Rails Tutorial Neo
group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'

  # CircleCIで必要
  gem 'rspec_junit_formatter'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

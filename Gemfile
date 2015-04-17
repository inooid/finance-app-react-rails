source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
gem 'pg'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# gem 'slim-rails'
gem 'react-rails', '~> 1.0'

# Cross-domain AJAX calls
gem 'rack-cors', require: 'rack/cors'

# Authentication for API
gem 'devise'
gem 'jwt'

group :develpment do
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'rubocop', require: false
  gem 'brakeman', require: false
  gem 'guard'
  gem 'guard-rspec', require: false
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'timecop'
end

group :test do
  gem 'codeclimate-test-reporter', require: false
end

# Bower components through Gemfile
source 'https://rails-assets.org' do
  gem 'rails-assets-chartist'
end

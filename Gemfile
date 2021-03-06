source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }
ruby '2.5.1'

gem 'bcrypt'
gem 'blueprinter', '~> 0.16.0'
gem 'cancancan'
gem 'carrierwave'
gem 'carrierwave-base64'
gem 'factory_bot_rails'
gem 'faker'
gem 'figaro'
gem 'fog-aws'
gem 'jwt'
gem 'knock'
gem 'mandrill-api'
gem 'mini_magick'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.2'
gem 'rspec-rails'
gem 'rswag'
gem 'rswag-specs'
gem 'sidekiq'
gem 'sprockets', '~> 3.7.2'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-clipboard'
  gem 'pry-doc'
  gem 'pry-docmore'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  # Create an erd pdf for reference
  gem 'rails-erd'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'json_matchers'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

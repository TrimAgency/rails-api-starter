source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'active_model_serializers'
gem 'bcrypt'
gem 'cancancan'
gem 'carrierwave'
gem 'carrierwave-base64'
gem 'figaro'
gem "fog-aws"
gem 'jwt'
gem 'knock'
gem 'mandrill-api'
gem 'mini_magick'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'rack-cors'
gem 'rails', '~> 5.1.5'
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-clipboard'
  gem 'pry-doc'
  gem 'pry-docmore'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails'
  gem 'json_matchers'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

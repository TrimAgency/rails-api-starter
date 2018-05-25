source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'bcrypt'
gem 'rack-cors'
gem 'active_model_serializers'
gem 'jwt'
gem 'knock'
gem 'figaro'
gem 'cancancan'
gem 'mandrill-api'
gem 'sidekiq'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'faker'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-clipboard'
  gem 'pry-doc'
  gem 'pry-docmore'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop', require: false
end

group :test do
  gem 'simplecov', require: false
  gem 'factory_bot_rails'
  gem 'json_matchers'
  gem 'rspec'
  gem 'rspec-json_expectations'
  gem 'webmock'
  gem 'shoulda-matchers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source 'https://rubygems.org'
ruby '2.5.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.7', '>= 5.0.7.2'
gem 'puma', '~> 4.3'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'devise', '~> 4.6', '>= 4.6.2'
gem 'figaro'
gem "bootstrap", ">= 4.3.1"
gem "bootstrap_flash_messages", "~> 1.0.1"
gem 'bourbon'
gem 'administrate', '~> 0.11.0'
gem 'pundit', '~> 2.0', '>= 2.0.1'
gem 'sendgrid-ruby'
gem 'nokogiri'


group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'capybara'
  gem 'database_cleaner', '~> 1.7'
  gem "factory_bot_rails"
  gem 'pry-rails', '~> 0.3.4'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

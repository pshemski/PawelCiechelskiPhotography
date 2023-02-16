source 'https://rubygems.org'

ruby '2.6.10'

gem 'rails', '4.2.10'

gem 'coffee-rails', '~> 4.1.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'turbolinks'
# gem 'unicorn'
# gem 'capistrano-rails', group: :development
gem 'carrierwave', '~> 1.0'
gem 'carrierwave_backgrounder', git: 'https://github.com/lardawge/carrierwave_backgrounder.git'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'figaro'
gem 'fog-aws', '~> 1.3.0'
gem 'font-awesome-rails'
gem 'mini_magick'
gem 'puma'

group :development, :test do
  gem 'byebug'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.6'
  gem 'spring-commands-rspec'
  gem 'sqlite3'
end

group :development do
  gem 'letter_opener'
  gem 'spring'
  gem 'web-console', '~> 2.0'
end

group :test do
  gem 'capybara'
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end

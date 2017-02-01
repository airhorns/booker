source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'rails_admin'
gem 'devise'
gem 'devise_invitable'

gem 'letter_opener'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0'
gem 'paper_trail'

gem 'gravatar_image_tag'

gem 'rets'
gem 'geocoder'
gem 'ice_cube'
gem 'schedulable'

group :development, :test do
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rubocop'
end

group :test do
  gem 'mocha'
end

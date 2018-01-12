source 'https://rubygems.org'
ruby '2.3.3'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'redcarpet'
gem 'devise'

group :development, :test do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_print', '0.2.1', require: 'ap'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'pry-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'spring'
  gem 'rubocop'
end

group :test do
  gem 'rspec-rails', '~> 3.0'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails'
  gem 'capybara', '~> 2.13'
  gem "chromedriver-helper", "1.0.0"
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

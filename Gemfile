source 'https://rubygems.org'
ruby '2.1.1'

gem 'bootstrap-sass'
gem 'coffee-rails'
gem 'rails', '4.1.1'
gem 'haml-rails'
gem 'sass-rails'
gem 'uglifier'
gem 'jquery-rails'

gem 'bootstrap_form' #a form builder
gem 'bcrypt', '~> 3.1.7' #for has_secure_password
gem 'fabrication' #fabrication gem for tests
gem 'faker' #for tests

group :development do
  gem 'sqlite3'
  gem 'thin'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'rspec-rails', '2.99'
  gem 'pry' #moved this to also have it in tests
  gem 'pry-nav'
end

group :test do
  gem 'database_cleaner', '1.2.0'
  gem 'shoulda-matchers'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end


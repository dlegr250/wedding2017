#======================================================================
# Gem source
#======================================================================

source "https://rubygems.org"

#======================================================================
# Rake
#======================================================================

gem "rake", "11.2.2"

#======================================================================
# Ruby
#======================================================================

ruby "2.2.3"

#======================================================================
# Rails
#======================================================================

gem "rails", "4.2.5.1"

#======================================================================
# Load ENV variables from .env file
#======================================================================

group :development, :test do
  gem "dotenv-rails", "~> 2.0.2"
end

#======================================================================
# Database
#======================================================================

gem "pg", "~> 0.18.4"

#======================================================================
# Assets
#======================================================================

gem "sass-rails", "~> 5.0.4"
gem "uglifier", "~> 2.7.2"
gem "coffee-rails", "~> 4.1.1"
gem "jquery-rails", "~> 4.1.0"
gem "turbolinks", "~> 2.5.3"
gem "jquery-turbolinks", "~> 2.1.0"
gem "nokogiri", "~> 1.6.7.2"
gem "premailer-rails", "~> 1.9.0"
gem "dlegr250_material_design", "~> 0.3.71"

# For relative timestamps on client-side
gem "local_time"

#======================================================================
# Heroku requirements
#======================================================================

# For Heroku logging
# See: https://devcenter.heroku.com/articles/getting-started-with-rails4
group :production do
  gem "rails_12factor", "~> 0.0.3"
end

#======================================================================
# Encryption
#======================================================================

gem "bcrypt", "~> 3.1.10"
gem "attr_encrypted", "~> 3.0.0"


#======================================================================
# Servers
#======================================================================

gem "puma", "~> 2.15.3"

#======================================================================
# Development and testing
#======================================================================

group :development, :test do
  gem "rspec-rails", "~> 3.3.3"
  gem "ffaker", "~> 2.1.0"
  gem "pry", "~> 0.10.3", require: false
end

group :development do
  gem "better_errors", "~> 2.1.1"
  gem "binding_of_caller", "~> 0.7.2"
  gem "annotate", "~> 2.7.1", require: false

  # Hide asset calls in development logs
  # See: https://github.com/evrone/quiet_assets
  gem "quiet_assets", "~> 1.1.0"
end

group :test do
  gem "capybara", "~> 2.5.0"
  gem "capybara-webkit", "~> 1.7.1"
  gem "factory_girl_rails", "~> 4.5.0"
  gem "database_cleaner", "~> 1.5.1"
end

source 'https://rubygems.org'
ruby "2.2.1"

gem 'shopify-sinatra-app', '~> 0.2.0', branch: 'master'
gem 'sinatra-activerecord'
gem 'sinatra-twitter-bootstrap', require: 'sinatra/twitter-bootstrap'
gem 'rack-flash3', require: 'rack-flash'
gem 'sendgrid-ruby'

gem 'resque-web', github: 'sshingler/resque-web'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'byebug'
end

group :development do
  gem 'rake'
  gem 'foreman'
  gem 'dotenv'
end

group :test do
  gem 'mocha', require: false
  gem 'minitest'
  gem 'rack-test'
  gem 'fakeweb'
  gem 'rspec'
end

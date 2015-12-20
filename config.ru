if Gem::Specification.find_all_by_name('dotenv').any?
  require 'dotenv'
  Dotenv.load
end

require './lib/app'
require 'resque/server'

map '/resque' do
  run Resque::Server
end

map '/' do
  run SinatraApp
end
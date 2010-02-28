require 'rubygems'
require 'sinatra'
require 'sequel'

Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://pass.db')

use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'admin']
end

get '/' do
  "Hello Passman!"
end

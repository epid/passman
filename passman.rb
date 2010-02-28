require 'rubygems'
require 'sinatra'

use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'admin']
end

get '/' do
  "Hello World!"
end

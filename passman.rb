require 'rubygems'
require 'sinatra'
require 'sequel'

configure do
  Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://pass.db')
end

$LOAD_PATH.unshift(File.dirname(__FILE__) + '/lib')
require 'entry'

use Rack::Auth::Basic do |username, password|
  [username, password] == ['admin', 'admin']
end

get '/' do
  "#{Entry.first.notes}"
end

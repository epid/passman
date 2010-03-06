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
  @entries = Entry.all
  haml :main
end

get '/e/:entry' do
  @entry = Entry[params[:entry]]
  halt [ 404, 'Entry not found!' ] unless @entry
  haml :show
end

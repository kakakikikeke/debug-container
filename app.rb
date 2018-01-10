require 'ohai'
require 'sinatra'
require 'sinatra/json'
require 'pp'

set :bind, '0.0.0.0'

get '/' do
  ohi = Ohai::System.new
  ohi.all_plugins
  if ENV['HOSTNAME_ONLY'] == "true"
    json ohi.data["hostname"]
  else
    json ohi.data
  end
end

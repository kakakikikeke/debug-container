# frozen_string_literal: true

require 'ohai'
require 'sinatra'
require 'sinatra/json'

set :bind, '0.0.0.0'
set :host_authorization, { permitted_hosts: [] }

get '/' do
  ohi = Ohai::System.new
  ohi.all_plugins
  if ENV['HOSTNAME_ONLY'] == 'true'
    json ohi.data['hostname']
  else
    json ohi.data
  end
end

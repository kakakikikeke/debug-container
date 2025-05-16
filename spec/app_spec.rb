# frozen_string_literal: true

require 'rack/test'
require 'rspec'
require_relative '../app'

RSpec.describe 'Sinatra App' do # rubocop:disable Metrics/BlockLength
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  let(:mock_ohai) do
    instance_double(Ohai::System, all_plugins: nil, data: { 'hostname' => 'myhost', 'os' => 'linux' })
  end

  before do
    allow(Ohai::System).to receive(:new).and_return(mock_ohai)
  end

  context 'when HOSTNAME_ONLY is not set' do
    before { ENV['HOSTNAME_ONLY'] = nil }

    it 'returns full ohai data as JSON' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq({ 'hostname' => 'myhost', 'os' => 'linux' })
    end
  end

  context 'when HOSTNAME_ONLY is set to true' do
    before { ENV['HOSTNAME_ONLY'] = 'true' }

    it 'returns only the hostname as JSON' do
      get '/'
      expect(last_response.status).to eq(200)
      expect(JSON.parse(last_response.body)).to eq('myhost')
    end
  end
end

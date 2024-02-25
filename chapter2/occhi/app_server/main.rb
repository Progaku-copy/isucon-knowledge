require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'sinatra'
end

get '/' do
  'Hello world!'
end

get '/welcome' do
  content_type :json
  response = {
    message: 'welcome to sinatra',
  }
  response.to_json
end

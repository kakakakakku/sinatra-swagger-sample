require 'json'
require 'sinatra'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

get '/users' do
  content_type :json
  [
    { id: 1, name: 'User1' },
    { id: 2, name: 'User2' },
    { id: 3, name: 'User3' },
    { id: 4, name: 'User4' },
    { id: 5, name: 'User5' }
  ].to_json
end

get '/resouces' do
  content_type :json
  swagger_json = File.open('./docs/swagger.json')
  swagger_json
end

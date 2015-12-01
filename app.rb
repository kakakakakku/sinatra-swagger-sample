require 'json'
require 'sinatra'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

users = [
  { id: 1, name: 'User1' },
  { id: 2, name: 'User2' },
  { id: 3, name: 'User3' },
  { id: 4, name: 'User4' },
  { id: 5, name: 'User5' }
]

get '/users' do
  content_type :json
  users.to_json
end

get '/users/:id' do
  content_type :json
  users.select { |user| user[:id] == params[:id].to_i }.to_json
end

get '/resources' do
  content_type :json
  swagger_json = File.open('./docs/swagger.json')
  swagger_json
end

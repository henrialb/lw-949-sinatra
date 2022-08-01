require "sinatra"
require "sinatra/reloader" if development?
require "sinatra/activerecord"
require "pry-byebug"
require "better_errors"
require_relative "config/application"

get "/" do
  @restaurants = Restaurant.all

  erb :index
end

get "/restaurants/:id" do
  restaurant_id = params[:id] # this is how we get the id from the URL

  @restaurant = Restaurant.find(restaurant_id)

  erb :show
end

post "/restaurants" do
  name = params[:name]
  city = params[:city]

  Restaurant.create(
    name: name,
    city: city
  )

  redirect '/'
end

# www.airbnb.com/flats      # list of all flats
# www.airbnb.com/flats/3    # one specific flat

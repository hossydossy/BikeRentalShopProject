# loads sinatra
require('sinatra')
# reloads file
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
require_relative('../models/bike.rb')
require_relative('../models/rental.rb')
# reloads models
also_reload('./models/*')



#INDEX - GET '/bikes' => all the bikes

get '/bike/' do
  @bikes = Bike.all()
  erb(:"bikes/index_bike")
end

get '/bike/available' do
  @bikes = Bike.available()
  erb(:"bikes/bike_available")
end

get '/bike/unavailable' do
  @bikes = Bike.unavailable()
  erb(:"bikes/bike_unavailable")
end

#NEW - GET '/bikes/new' => page where we add a new bike

get '/bike/new' do
  erb (:"bikes/new_bike")
end

#EDIT - GET '/bikes/:id/edit' => page where we can edit bike[:id] details

get '/bike/:id/edit' do
  @bike = Bike.find(params[:id])
  erb( :"bikes/edit")
end

#SHOW - GET '/bikes/:id' => individual bike

get '/bike/search' do
  @bike = Bike.new(params)
  erb( :"bikes/search")
end

get '/bike/:id' do
  @bike = Bike.find(params['id'].to_i)
  erb( :"bikes/show")
end

get '/bike/execute_search/' do
  @bike = Bike.search_by_name(params['name'])
  erb( :"bikes/show")
end

#UPDATE - POST '/bikes/:id' => update a bike in the db

post '/bike/:id' do
  @bike = Bike.new(params)
  @bike.update()
  redirect('/bike/')
end

#CREATE - POST '/bikes' => save the new bike to db

post '/bike/' do
  bike = Bike.new(params)
  bike.save()
  erb( :"bikes/create")
end

#DESTROY - POST '/bikes/:id/delete' delete bike from db

post '/bike/:id/delete' do
  @bike = Bike.find(params[:id])
  @bike.delete()
  redirect to '/bike/'
end

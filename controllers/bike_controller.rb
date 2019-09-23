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

get '/bikes' do
  @bikes = Bike.all()
  erb(:"bikes/index_bike")
end

#NEW - GET '/bikes/new' => page where we add a new bike

get '/bikes/new' do
  erb (:"bikes/new_bike")
end

#EDIT - GET '/bikes/:id/edit' => page where we can edit bike[:id] details

get '/bikes/:id/edit' do
  @bike = Bike.find(params[:id])
    erb( :"bikes/edit")
end

#SHOW - GET '/bikes/:id' => individual bike

get '/bikes/:id' do
  @bike = Bike.find(params['id'].to_i)
  erb( :"bikes/show")
end

#UPDATE - POST '/bikes/:id' => update a bike in the db

post '/bikes/:id' do
@bike = Bike.new(params)
@bike.update()
redirect('/bikes')
end

#CREATE - POST '/bikes' => save the new bike to db

post '/bikes' do
  bike = Bike.new(params)
  bike.save()
  erb( :"bikes/create")
end

#DESTROY - POST '/bikes/:id/delete' delete bike from db

post '/bikes/:id/delete' do
  @bike = Bike.find(params[:id])
  @bike.delete()
  redirect to '/bikes'
end

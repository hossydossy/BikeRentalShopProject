# loads sinatra
require('sinatra')
# reloads file
require('sinatra/contrib/all')
require_relative('../models/customer.rb')
require_relative('../models/bike.rb')
require_relative('../models/rental.rb')
# reloads models
also_reload('./models/*')



#INDEX - GET '/rentals' => all the rentals

get '/rental/' do
  @rentals = Rental.all()
  erb(:"rentals/index_rental")
end

#NEW - GET '/rentals/new' => page where we add a new rental

get '/rental/new' do
  @customers = Customer.all()
  @bikes = Bike.all()
  erb (:"rentals/new_rental")
end

#EDIT - GET '/rentals/:id/edit' => page where we can edit rental[:id] details

get '/rental/:id/edit' do
  @rental = Rental.find(params[:id])
    erb( :"rentals/edit")
end

#SHOW - GET '/rentals/:id' => individual rental

get '/rental/:id' do
  @rental = Rental.find(params['id'].to_i)
  erb( :"rentals/show")
end

#UPDATE - POST '/rentals/:id' => update a rental in the db

post '/rental/:id' do
@rental = Rental.new(params)
@rental.update()
redirect('/rental')
end

#CREATE - POST '/rentals' => save the new rental to db

post '/rental/' do
  rental = Rental.new(params)
  rental.save()
  found_bike = rental.bike()
  found_bike.bike_available = false
  found_bike.update()
  erb( :"rentals/create")
end

post '/rental/end/:bike_id' do
  found_bike = Bike.find(params[:bike_id])
  found_bike.bike_available = true
  found_bike.update()
  redirect to '/bike/unavailable'
end

#DESTROY - POST '/rentals/:id/delete' delete rental from db

post '/rental/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete()
  redirect to '/rental/'
end

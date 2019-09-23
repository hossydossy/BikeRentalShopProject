# loads sinatra
require('sinatra')
# reloads file
require('sinatra/contrib/all')
require_relative('./models/customer.rb')
require_relative('./models/bike.rb')
require_relative('./models/rental.rb')
# reloads models
also_reload('./models/*')



#INDEX - GET '/rentals' => all the rentals

get '/rentals' do
  @rentals = Rental.all()
  erb(:index_rental)
end

#NEW - GET '/rentals/new' => page where we add a new rental

get '/rentals/new' do
  erb (:"rentals/new_rental")
end

#EDIT - GET '/rentals/:id/edit' => page where we can edit rental[:id] details

get '/rentals/:id/edit' do
  @rental = Rental.find(params[:id])
    erb( :"rentals/edit")
end

#SHOW - GET '/rentals/:id' => individual rental

get '/rentals/:id' do
  @rental = Rental.find(params['id'].to_i)
  erb( :"rentals/show")
end

#UPDATE - POST '/rentals/:id' => update a rental in the db

post '/rentals/:id' do
@rental = Rental.new(params)
@rental.update()
redirect('/rentals')
end

#CREATE - POST '/rentals' => save the new rental to db

post '/rentals' do
  rental = Rental.new(params)
  rental.save()
  erb( :"rentals/create")
end

#DESTROY - POST '/rentals/:id/delete' delete rental from db

post '/rentals/:id/delete' do
  @rental = Rental.find(params[:id])
  @rental.delete()
  redirect to '/rentals'
end

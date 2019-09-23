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

#NEW - GET '/rentals/new' => page where we process a rental

#EDIT - GET '/students/:id/edit' => page where we can edit student[:id]s details

#SHOW - GET '/students/:id' => individual student

#UPDATE - POST '/students/:id' => update a student in the db

#CREATE - POST '/students' => save the new student to db


#DESTROY - POST '/students/:id/delete' delete student from db

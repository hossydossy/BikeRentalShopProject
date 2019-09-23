# loads sinatra
require('sinatra')
# reloads file
require('sinatra/contrib/all')
require_relative('./models/customer.rb')
require_relative('./models/bike.rb')
require_relative('./models/rental.rb')
# reloads models
also_reload('./models/*')



#INDEX - GET '/customers' => all the customers

get '/customers' do
  @customers = Customer.all()
  erb( :"customer/index_customers")
end

#NEW - GET '/rentals/new' => page where we add a new customer

get '/customers/new' do
  erb (:"customers/new_customer")
end

#EDIT - GET '/customers/:id/edit' => page where we can edit customer[:id] details

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
    erb( :"customers/edit")
end

#SHOW - GET '/customers/:id' => individual customer

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  erb( :"customers/show")
end

#UPDATE - POST '/customers/:id' => update a customer in the db

post '/customers/:id' do
@customer = Customer.new(params)
@customer.update()
redirect('/customers')
end

#CREATE - POST '/students' => save the new student to db

post '/customers' do
  customer = Customer.new(params)
  customer.save()
  erb( :"customers/create")
end

#DESTROY - POST '/students/:id/delete' delete student from db

post '/customers/:id/delete' do
  @customer = Customer.find(params[:id])
  @customer.delete()
  redirect to '/customers'
end

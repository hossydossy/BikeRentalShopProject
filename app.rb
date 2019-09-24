require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bike_controller')
require_relative('controllers/customer_controller')
require_relative('controllers/rental_controller')

get '/' do
  @customers = Customer.all()
  @bikes = Bike.all()
  @rentals = Rental.all()
  erb( :index)
end

get '/about/' do
  erb( :about)
end

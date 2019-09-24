require_relative('../models/bike.rb')
require_relative('../models/customer.rb')
require_relative('../models/rental.rb')

require("pry-byebug")

Bike.delete_all()
Customer.delete_all()
Rental.delete_all()

bike1 = Bike.new({
  "name" => "Specialized Rockhopper",
  "size" => "1",
  "bike_available" => true
})

bike1.save()

bike2 = Bike.new({
  "name" => "Specialized Stumpjumper",
  "size" => "2",
  "bike_available" => true
})

bike2.save()

bike3 = Bike.new({
  "name" => "Specialized Hardrock",
  "size" => "1",
  "bike_available" => true
})

bike3.save()

bike4 = Bike.new({
  "name" => "Kona Kileuia",
  "size" => "5",
  "bike_available" => true
})

bike4.save()

bike5 = Bike.new({
  "name" => "Kona Explosif",
  "size" => "4",
  "bike_available" => false
})

bike5.save()

bike6 = Bike.new({
  "name" => "Trek 9000",
  "size" => "1",
  "bike_available" => true
})

bike6.save()

bike7 = Bike.new({
  "name" => "Trek 8000",
  "size" => "3",
  "bike_available" => false
})

bike7.save()

bike8 = Bike.new({
  "name" => "Klein Attitude",
  "size" => "3",
  "bike_available" => true
})

bike8.save()

bike9 = Bike.new({
  "name" => "Cannondale 400",
  "size" => "3",
  "bike_available" => true
})

bike9.save()

bike10 = Bike.new({
  "name" => "Cannondale 1000",
  "size" => "3",
  "bike_available" => true
})

bike10.save()

customer1 = Customer.new({
  "name" => "Catherine O Donnell",
  "address" => "10 Darleith Street, Glasgow"
})

customer1.save()

customer2 = Customer.new({
  "name" => "Peter McGunnigal",
  "address" => "42 Shawsburn road, Strathaven"
})

customer2.save()

customer3 = Customer.new({
  "name" => "Elaine McGunnigal",
  "address" => "42 Shawsburn road, Strathaven"
})

customer3.save()

customer4 = Customer.new({
  "name" => "Kevin Loder",
  "address" => "621 Alexandra Parade, Glasgow"
})

customer4.save()

customer5 = Customer.new({
  "name" => "Amanda McColl",
  "address" => "1 Hope Street, Johnstone"
})

customer5.save()

customer6 = Customer.new({
  "name" => "Alex Adam",
  "address" => "67 Baillieston Road, Glasgow"
})

customer6.save()

customer7 = Customer.new({
  "name" => "Stephen Foreman",
  "address" => "45 Rampant Square, Kings Park, Glasgow"
})

customer7.save()

rental1 = Rental.new({
  "customer_id" => customer1.id,
  "bike_id" => bike5.id,
  "rental_date" => "7th May 2019"
})

rental1.save()

rental2 = Rental.new({
  "customer_id" => customer1.id,
  "bike_id" => bike2.id,
  "rental_date" => "27th February 2019"
})

rental2.save()

rental3 = Rental.new({
  "customer_id" => customer1.id,
  "bike_id" => bike7.id,
  "rental_date" => "7th June 2019"
})

rental3.save()

rental4 = Rental.new({
  "customer_id" => customer6.id,
  "bike_id" => bike1.id,
  "rental_date" => "6th June 2019"
})

rental4.save()

rental5 = Rental.new({
  "customer_id" => customer4.id,
  "bike_id" => bike1.id,
  "rental_date" => "26th August 2019"
})

rental5.save()

rental6 = Rental.new({
  "customer_id" => customer4.id,
  "bike_id" => bike1.id,
  "rental_date" => "10th January 2019"
})

rental6.save()

rental7 = Rental.new({
  "customer_id" => customer4.id,
  "bike_id" => bike2.id,
  "rental_date" => "1st April 2019"
})

rental7.save()



binding.pry
nil

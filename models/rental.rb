require_relative('../db/sql_runner')
require_relative('./bike.rb')
require_relative('./customer.rb')

class Rental

  attr_accessor :customer_id, :bike_id
  attr_reader :rental_id

  def initialize(options)
    @customer_id = options['customer_id'].to_i
    @bike_id = options['bike_id'].to_i
    @rental_id = options['rental_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (
      customer_id,
      bike_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING rental_id"
    values = [@customer_id, @bike_id]
    result = SqlRunner.run(sql, values)
    id = result.first['rental_id']
    @rental_id = id
  end

  def update()
    sql = "UPDATE rentals
    SET
    (
      customer_id,
      bike_id
      ) =
      (
        $1, $2
      )
      WHERE rental_id = $3"
      values = [@customer_id, @bike_id, @rental_id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM rentals
      WHERE id = $1"
      values = [@rental_id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM rentals"
      rental_data = SqlRunner.run(sql)
      rentals = map_items(rental_data)
      return rentals
    end

    def self.map_items(rental_data)
      return rental_data.map { |rental| Rental.new(rental) }
    end

    def self.find(rental_id)
      sql = "SELECT * FROM rentals
      WHERE rental_id = $1"
      values = [rental_id]
      result = SqlRunner.run(sql, values).first
      rental = Rental.new(result)
      return rental
    end

    def self.delete_all()
      sql = "DELETE FROM rentals"
      SqlRunner.run( sql )
    end

    def customer()
      sql = "SELECT * FROM customers
      WHERE id = $1"
      values = [@customer_id]
      results = SqlRunner.run(sql, values)
      customer_hash = results[0]
      customer = Customer.new(customer_hash)
      return customer
    end

    def bike()
      sql = "SELECT * FROM bikes
      WHERE id = $1"
      values = [@bike_id]
      results = SqlRunner.run(sql, values)
      bike_hash = results[0]
      bike = Bike.new(bike_hash)
      return bike
    end

  end

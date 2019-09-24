require_relative('../db/sql_runner')
require_relative('./bike.rb')
require_relative('./rental.rb')

class Customer

  attr_accessor :name, :address
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO customers
    (
      name,
      address
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @address]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      name,
      address
      ) =
      (
        $1, $2
      )
      WHERE id = $3"
      values = [@name, @address, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM customers
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM customers"
      customer_data = SqlRunner.run(sql)
      customers = map_items(customer_data)
      return customers
    end

    def self.map_items(customer_data)
      return customer_data.map { |customer| Customer.new(customer) }
    end

    def self.find(id)
      sql = "SELECT * FROM customers
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      customer = Customer.new(result)
      return customer
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run( sql )
    end

    def bikes()
      sql = "SELECT bikes.* FROM bikes INNER JOIN rentals ON bikes.id = rentals.bike_id
      WHERE customer_id = $1"
      values = [@id]
      results = SqlRunner.run(sql, values)
      bikes = results.map{ |bike| Bike.new(bike)}
      return bikes
    end

    def format_name
      return "#{@name.capitalize}"
    end

  end

require_relative('../db/sql_runner')
require_relative('./bike.rb')
require_relative('./rental.rb')

class Customer

  attr_accessor :first_name, :last_name, :address
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @address = options['address']
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      last_name,
      address
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@first_name, @last_name, @address]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      first_name,
      last_name,
      address
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@first_name, @last_name, @address, @id]
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

    def format_name
      return "#{@first_name.capitalize} #{@last_name.capitalize}"
    end

    def self.delete_all()
      sql = "DELETE FROM customers"
      SqlRunner.run( sql )
    end

  end

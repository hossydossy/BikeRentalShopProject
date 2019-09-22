require_relative('../db/sql_runner')
require_relative('./customer.rb')
require_relative('./rental.rb')

class Bike

  attr_accessor :name, :size, :bike_available
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @size = options['size']
    @bike_available = options['bike_available']
  end

  def save()
    sql = "INSERT INTO bikes
    (
      name,
      size,
      bike_available
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @size, @bike_available]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def update()
    sql = "UPDATE bikes
    SET
    (
      name,
      size,
      bike_available
      ) =
      (
        $1, $2, $3
      )
      WHERE id = $4"
      values = [@name, @size, @bike_available, @id]
      SqlRunner.run(sql, values)
    end

    def delete()
      sql = "DELETE FROM bikes
      WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.all()
      sql = "SELECT * FROM bikes"
      bike_data = SqlRunner.run(sql)
      bikes = map_items(bike_data)
      return bikes
    end

    def self.map_items(bike_data)
      return bike_data.map { |bike| Bike.new(bike) }
    end

    def self.find(id)
      sql = "SELECT * FROM bikes
      WHERE id = $1"
      values = [id]
      result = SqlRunner.run(sql, values).first
      bike = Bike.new(result)
      return bike
    end

  end
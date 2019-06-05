require_relative("../db/sql_runner")

class House

  attr_reader :id
  attr_accessor :name, :url

  def initialize(options)
    @name = options["name"]
    @url = options["url"]
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO houses (
      name, url
    ) VALUES (
      $1, $2
    ) RETURNING *"
    values = [@name, @url]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update
    sql = "UPDATE houses SET (
      name, url
    ) = (
      $1, $2
    ) WHERE id = $3"
    values = [@name, @url, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM houses WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.all
    sql = "SELECT * FROM houses"
    houses_data = SqlRunner.run(sql, values)
    return houses_data.map{|house| House.new(house)}
  end

  def self.find(id)
    sql = "SELECT * FROM houses WHERE id = $1"
    values = [@id]
    house_data = SqlRunner.run(sql, values)[0]
    return House.new(house_data)
  end

  def self.delete_all
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end

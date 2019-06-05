require_relative("../db/sql_runner")
require_relative("house")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"].to_i
    @house_id = options["house_id"].to_i
    @id = options["id"].to_i if options["id"]
  end

  def save
    sql = "INSERT INTO students (
      first_name, last_name, age, house_id
    ) VALUES (
      $1, $2, $3, $4
    ) RETURNING *"
    values = [@first_name, @last_name, @age, @house_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update
    sql = "UPDATE students SET (
      first_name, last_name, age, house_id
    ) = (
      $1, $2, $3, $4
    ) WHERE id = $5"
    values = [@first_name, @last_name, @age, @house_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pretty_name
    return "#{last_name}, #{first_name}"
  end

  def house
    sql = "SELECT houses.* FROM houses INNER JOIN students
    ON houses.id = students.house_id WHERE students.id = $1"
    values = [@id]
    house_data = SqlRunner.run(sql, values)[0]
    return House.new(house_data)
  end

  def self.all
    sql = "SELECT * FROM students"
    students_data = SqlRunner.run(sql)
    return students_data.map{|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student_data = SqlRunner.run(sql, values)[0]
    return Student.new(student_data)
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end

end

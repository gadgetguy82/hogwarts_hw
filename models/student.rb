require_relative("../db/sql_runner")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :age, :house_id

  def initialize(options)
    @first_name = options["first_name"]
    @last_name = options["last_name"]
    @age = options["age"].to_i
    @house_id = options["house_id"]
    @id = options["id"].to_i if options["id"]
  end

  

end

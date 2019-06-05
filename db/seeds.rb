require_relative("../models/student")
require_relative("../models/house")

Student.delete_all
House.delete_all

gryffindor = House.new(
  {
    "name" => "Gryffindor",
    "url" => "/hogwarts/gryffindor"
  }
)

hufflepuff = House.new(
  {
    "name" => "Hufflepuff",
    "url" => "hogwarts/hufflepuff"
  }
)

ravenclaw = House.new(
  {
    "name" => "Ravenclaw",
    "url" => "/hogwarts/ravenclaw"
  }
)

slytherin = House.new(
  {
    "name" => "Slytherin",
    "url" => "/hogwarts/slytherin"
  }
)

gryffindor.save
hufflepuff.save
ravenclaw.save
slytherin.save

student1 = Student.new(
  {
    "first_name" => "Harry",
    "last_name" => "Potter",
    "age" => 11,
    "house_id" => gryffindor.id
  }
)

student2 = Student.new(
  {
    "first_name" => "Hermione",
    "last_name" => "Granger",
    "age" => 11,
    "house_id" => gryffindor.id
  }
)

student3 = Student.new(
  {
    "first_name" => "Ron",
    "last_name" => "Weasley",
    "age" => 11,
    "house_id" => gryffindor.id
  }
)

student4 = Student.new(
  {
    "first_name" => "Draco",
    "last_name" => "Malfoy",
    "age" => 11,
    "house_id" => slytherin.id
  }
)

student5 = Student.new(
  {
    "first_name" => "Luna",
    "last_name" => "Lovegood",
    "age" => 11,
    "house_id" => ravenclaw.id
  }
)

student6 = Student.new(
  {
    "first_name" => "Hannah",
    "last_name" => "Abbott",
    "age" => 11,
    "house_id" => hufflepuff.id
  }
)

student1.save
student2.save
student3.save
student4.save
student5.save
student6.save

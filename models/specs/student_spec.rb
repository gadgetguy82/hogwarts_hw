require("minitest/autorun")
require("minitest/rg")
require_relative("../student")

class StudentTest < Minitest::Test

  def setup
    @student = Student.new(
      {
        "first_name" => "Harry",
        "last_name" => "Potter",
        "age" => 12,
        "house_id" => 1
      }
    )
  end

  def test_get_first_name
    assert_equal("Harry", @student.first_name)
  end

  def test_get_last_name

  end

end

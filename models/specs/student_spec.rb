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
    assert_equal("Potter", @student.last_name)
  end

  def test_get_age
    assert_equal(12, @student.age)
  end

  def test_get_house_id
    assert_equal(1, @student.house_id)
  end

  def test_get_pretty_name
    assert_equal("Harry Potter", @student.pretty_name)
  end

end

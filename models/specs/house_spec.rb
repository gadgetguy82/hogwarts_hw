require("minitest/autorun")
require("minitest/rg")
require_relative("../house")

class HouseTest < Minitest::Test

  def setup
    @house = House.new(
      {
        "name" => "Gryffindor",
        "url" => ""
      }
    )
  end

  def test_get_name
    assert_equal("Gryffindor", @house.name)
  end

  def test_get_url
    assert_equal("", @house.url)
  end

end

require 'test/unit'
require_relative 'song'

class SongTest < Test::Unit::TestCase

  def test_user_input_country_should_be_valid
  song = Song.new.recommend('US','romance')
  actual = get_country
  expected = "US"
  message = "Country code should be valid"
  assert_equal(expected, actual, message)
  end

end

require 'test/unit'
require_relative 'song'

class SongTest < Test::Unit::TestCase

  def test_user_input_country_should_be_valid
  song = Song.new
  actual = song.recommend('US','romance')
  expected = "US"
  message = "Country code should be valid"
  assert_equal(expected, actual, message)
  end

end

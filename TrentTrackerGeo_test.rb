require "test/unit"
require_relative "TrentTrackerGeo" # Insert file name
require_relative "config"

#This tests whether the
class GoogleMaps_test < Test::Unit::TestCase

	def test_GoogleMaps
	  	google_maps_class = GoogleMaps.new
	  	actual = google_maps_class
	  	expected = google_maps_class.maps
	  	msg = "Enter maps"
		assert_equal(expected, actual, msg)
	end

  def test_GoogleMaps1
	  	google_maps_class = GoogleMaps.new
	  	actual = google_maps_class
	  	expected = google_maps_class.execute("what")
	  	msg = "Enter maps"
		assert_equal(expected, actual, msg)
	end

end

require "test/unit"
require_relative "" # Insert file name

#Tests
class ProjectTest < Test::Unit::TestCase

	def test_project # Replace project with whatever you're testing
		# Fill in the blanks
	  	 = .new("", "")
	  	actual = 
	  	expected = "" 
	  	msg = ""
		assert_equal(expected, actual, msg)  	
	end

	def test_something # As above
		# test case
	  	 = .new("", "")
	  	# assertion
	  	assert_equal("", ., 
	  		"")
	end
end
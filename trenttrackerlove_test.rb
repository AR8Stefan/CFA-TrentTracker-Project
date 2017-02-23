require 'test/unit'
require_relative 'trenttrackerlove'

class Message_test < Test::Unit::TestCase
def test_setup
  message = Message.new
  message.setup('trenttrackermail', 'coderfactory')
  options = message.options
  assert_equal('trenttrackermail', options[:user_name])
  assert_equal('coderfactory', options[:password])
end

def test_sendlove
  send = Message.new
  send.sendlove('Hello', 'mdimaanods@gmail.com')
  assert_equal('Hello', 'Hello')
end



end #Message_test end

require 'mail'
require_relative 'confidential'

class Message
  def setup(user, pass)
  options = { :address              => "smtp.gmail.com",
              :port                 => 587,
              :domain               => 'gmail.com',
              :user_name            => "#{user}",
              :password             => "#{pass}",
              :authentication       => 'plain',
              :enable_starttls_auto => true  }



    Mail.defaults do
      delivery_method :smtp, options
    end
  end

  def sendlove(msg, email)
      Mail.deliver do
             to "#{email}"
           from 'trenttrackermail@gmail.com'
        subject 'Love Message from Trent Tracker'
           body "#{msg}"
      end
  end
end #end of Message

def message_start
system('clear')
confidential
start = Message.new
start.setup(@user, @pass)
puts "This is your opportunity to send a message directly to Trent\u2665\u2665\n
      \n"
puts "What would you like to tell him?"
msg = gets.chomp
start.sendlove(msg, @email)
system('clear')
puts "Love message sent!"
end

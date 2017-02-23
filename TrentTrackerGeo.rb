=begin
Challenge:

In your group of 3-4
Create a ruby terminal app that will blow Trent’s socks off when he comes back on Friday
On Friday morning each group will present their project

Requirements

Idea: Whacky, crazy, funny, clever etc
Classes: 3+
Gems: 2+
Design process: true
Tests: 2 per Class
=end

# we have trent's current location in the form of an address and the Trent Lover will
# put in their city and it will return how far away they are from Trent's location

require 'google_maps_service'
require_relative 'config'

class GoogleMaps

  attr_accessor :maps

  def initialize
    @maps = GoogleMapsService::Client.new(key: Config::API_KEY)
  end

end

def location(gmaps, origins, destinations, method)


  puts "Calculating..."
  matrix = gmaps.maps.distance_matrix(origins, destinations,
    mode: method,
    language: 'en-AU',
    avoid: 'tolls',
    units: 'metric')

    system 'clear'

    puts "You're " +
    matrix[:rows][0][:elements][0][:distance][:text] + " " +
    "away from admiring Trent."
    puts "It'll take you" + " " +
    matrix[:rows][0][:elements][0][:duration][:text] + " " +
    "to get close to admire Trent."

end

# test this input
def enter_origin
  puts "You're not within range of Trent " +
        "to better appreciate him, tell us your " +
        "addressand we'll locate him for you." +
        "Press enter and we'll get started."

  system 'clear'

continue = 'n'

while continue == 'n'
   print "Lets start with you street number and street name: "
   street = gets.chomp

   system 'clear'

   print "Groovy, now put in your suburb: "
   suburb = gets.chomp

   system 'clear'

   print "Good. Now enter your State, you're getting closer: "
   state = gets.chomp

   system 'clear'

   print "Finally, one step closer to better appreciating Trent. " +
        "Please enter your country: "
   country = gets.chomp

   system 'clear'

   address = street + " " + suburb + " " + state + " " + country

   print "Is this your address? " + address + "." + " "
   print "(Y)es or (N)o? "
   continue = gets.chomp.downcase

   system 'clear'

   if continue == 'n'
     puts '*sigh*, lets try again'
     gets.chomp
     system 'clear'
   end

   system 'clear'

  end

  return address.downcase
end

def where_trent

  addresses = [
           '7 Kelly Street, Ultimo, NSW, Australia',
           '120 Spencer Street, Melbourne, VIC',
           '77 Castle Street Castle Hill, NSW 2154 Australia',
           '7114 Kundiman Street, Sampaloc 1008 Manila Philippines'
         ]
  address = addresses.sample(1)

  puts address.inspect

  return address

end

def mode

  mode = 'a'

  while mode == 'a'
    print "Opps, forgot something. How do you want to get to Trent? " +
        "(W)alk? or (D)rive? "

    mode = gets.chomp.downcase

    system 'clear'

    if mode == 'w'
      return 'walking'
    elsif mode == 'd'
      return 'driving'
    else
      puts "Wrong input, please enter again. Soooo close!"
      system 'clear'
    end
  end

end

def geostart
origin = enter_origin

destination = where_trent

method = mode

maps = GoogleMaps.new

puts location(maps, origin, destination, method)
end

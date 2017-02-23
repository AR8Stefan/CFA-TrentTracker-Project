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
#require_relative 'song'

class GoogleMaps

  attr_accessor :maps, :something

  def initialize
    @maps = GoogleMapsService::Client.new(key: Config::API_KEY)
  end

  def execute(hello)
  end

end

# this finds the distance and time away from Trent and prints it out while sending out
# a country name to be used with the spotify function
def location(gmaps, origins, destinations)#, method)
=begin
  @rows = []
  @rows << [temp]

  @table3 = Terminal::Table.new :title => " \u2665 Admiration Distance & Time! \u2665 ",
  :rows => @rows, :style => {:width => 55,  :border_i => "\u2665"}
=end

  puts "Calculating..."
  matrix = gmaps.maps.distance_matrix(origins, destinations,
    mode: 'driving',
    language: 'en-AU',
    avoid: 'tolls',
    units: 'metric')

    country = destinations.map{|i| "" + i.to_s + ""}.join(",")

    country1 = country.split(",").last

    system 'clear'

    puts "You're " +
    matrix[:rows][0][:elements][0][:distance][:text] + " " +
    "away from admiring Trent."
    puts "It'll take you" + " " +
    matrix[:rows][0][:elements][0][:duration][:text] + " " +
    "to get closer to admire Trent."

    puts "\nPress enter to return to the admiration menu"
    gets.chomp
    system 'clear'

    return country1

end

# selects mode
def mode

  mode = 'a'

  while mode == 'a'
    @prompt_sel_count += 5
    prompt_sel(@prompt_sel_count)
    puts "printing method table"
    puts @table2

    mode = gets.chomp.downcase

    #system 'clear'

    if mode == 'w'
      return 'walking'
    elsif mode == 'd'
      return 'driving'
    elsif mode == 'p'
      return 'transit'
    else
      puts "Wrong input, please enter again. Soooo close!"
      system 'clear'
    end
  end

end

# asks the user for their current location and spits out address as string
def enter_origin

  puts "call mode"
  #mode

  @prompt_sel_count = 0
  in_loop_limit = 4

  # contains the prompts in a table and table data
  def prompt_sel(sel_num)

    sel_arr = [
         "\tYou're not within range of Trent\n
          to better appreciate him, tell us your\n
          address and we'll locate him for you.\n
          Press enter and we'll get started.",
          "Lets start with you street \n number and street name: ",
          "Groovy, now put in your suburb: ",
          "Good. Now enter your State, you're getting closer: ",
          "Finally, you're one step closer to\n better appreciating Trent.\n
           Please enter your country: ",
           "Is this your address?\n #{@address}.\n
            (Y)es or (N)o? ",
           '*le sigh*, press enter to try again',
           "Remember Y = yes and N = no.\n
           Please select either one so we can continue",
           "Opps, we forgot something.\n How do you want to get to Trent?
           (W)alk? (D)rive? or (P)ublic Transit? "

        ]

    temp = sel_arr[sel_num]

    @rows = []
    @rows << [temp]

    @table2 = Terminal::Table.new :title => " \u2665 Admiration Distance & Time? \u2665 ",
    :rows => @rows, :style => {:width => 55,  :border_i => "\u2665"}


  end

  prompt_sel(@prompt_sel_count)
  puts @table2

  system 'clear'

  continue = 'n'

while continue != 'y'

  while @prompt_sel_count < in_loop_limit
   @prompt_sel_count += 1
   prompt_sel(@prompt_sel_count)
   puts @table2

   if @prompt_sel_count == 1
     street = gets.chomp
     system 'clear'
   elsif @prompt_sel_count == 2
     suburb = gets.chomp
     system 'clear'
   elsif @prompt_sel_count == 3
     state = gets.chomp
     system 'clear'
   elsif @prompt_sel_count == 4
     country = gets.chomp
     system 'clear'
   end
 end

  @address = street + " " + suburb + " " + state + " " + country

  @prompt_sel_count += 1
  prompt_sel(@prompt_sel_count)
  puts @table2
  continue = gets.chomp.downcase

  system 'clear'

   if continue == 'n'
     @prompt_sel_count += 1
     prompt_sel(@prompt_sel_count)
     puts @table2
     gets.chomp
     system 'clear'

     if continue != 'n' && continue != 'y'
       @prompt_sel_count += 1
       prompt_sel(@prompt_sel_count)
       puts @table2
       gets.chomp
     end

   end

   @prompt_sel_count = 0
   system 'clear'

  end

  return @address.downcase
end

# an array of places Trent has been
def where_trent

  addresses = [
           '7 Kelly Street, Ultimo, NSW, Australia',
           '120 Spencer Street, Melbourne, VIC, Australia',
           '77 Castle Street, Castle Hill, NSW, 2154, Australia',
           '7114 Kundiman Street Sampaloc 1008 Manila Philippines'
         ]
  address = addresses.sample(1)

  return address

end


# main program sequence
def geostart
 origin = enter_origin

 destination = where_trent

 #method = mode

 maps = GoogleMaps.new

 location(maps, origin, destination)#, method)
end

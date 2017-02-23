require 'terminal-table'
# require 'rspotify'
# require 'geocoder'

rows = []
rows << ['Where is Trent?', 1]
rows << ['Make a Mix Tape', 2]
rows << ['Love Letter', 3]
table1 = Terminal::Table.new :title => " \u2665 Trent Tracker \u2665 ", :headings => ['Options', 'Number'], :rows => rows, :style => {:width => 30, :border_x => "=", :border_i => "\u2665"}

rows = []
rows << ['Where is Trent?', 1]
rows << ['Make a Mix Tape', 2]
rows << ['Love Letter', 3]
rows << ['Type to "4" exit', 4]
table2 = Terminal::Table.new :rows => rows, :style => {:width => 30, :border_x => "=", :border_i => "\u2665"}
# Insert Splash-Screen

system "cls" || system(clear)

puts	"
.######..#####...######..##..##..######..........######..#####....####....####...##..##..######..#####..
...##....##..##..##......###.##....##..............##....##..##..##..##..##..##..##.##...##......##..##.
...##....#####...####....##.###....##..............##....#####...######..##......####....####....#####..
...##....##..##..##......##..##....##..............##....##..##..##..##..##..##..##.##...##......##..##.
...##....##..##..######..##..##....##..............##....##..##..##..##...####...##..##..######..##..##.
...........................An Admiration Tool for the Modern Day Trent Lovers...........................

     "

puts "Press Any Key to continue"
enter = gets.chomp

system "cls" || system(clear)

puts table1

loop do
print "Select a number to interact with Trent\n"
input = gets.chomp.to_i

	system "cls" || system(clear)
	
	if input == 1
			puts table2
			puts "Behind YOU!"
		elsif input == 2
			puts table2
			puts "Love Songs!"
		elsif input == 3
			puts table2
			puts "Write a love letter"
		elsif input == 4
			break
		else
			puts "Please Enter a Valid Number."
	end

end
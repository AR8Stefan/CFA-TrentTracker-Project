require 'terminal-table'
# require_relative 'trenttrackerlove'
require_relative 'TrentTrackerGeo'
# require_relative 'song'

rows = []
rows << ['Where is Trent?', 1]
rows << ['Make a Mix Tape', 2]
rows << ['Love Letter', 3]
@table1 = Terminal::Table.new :title => " \u2665 Trent Tracker \u2665 ", :headings => ['Options', 'Number'], :rows => rows, :style => {:width => 30, :border_x => "=", :border_i => "\u2665"}

# rows = []
# rows << ['Where is Trent?', 1]
# rows << ['Make a Mix Tape', 2]
# rows << ['Love Letter', 3]
# rows << ['Type to "4" exit', 4]
# @table2 = Terminal::Table.new :rows => rows, :style => {:width => 30, :border_x => "=", :border_i => "\u2665"}

def trent_track
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

	system "cls"
	system('clear')

	puts @table1

	loop do
	print "Select a number to interact with Trent\n"
	input = gets.chomp.to_i

		system "cls" || system(clear)

		if input == 1
			  geostart
				puts @table1
			elsif input == 2
				require_relative 'song'
				songstart
				puts @table1
			elsif input == 3
				require_relative 'trenttrackerlove'
				message_start
				puts @table1
			elsif input == 4
				break
			else
				puts @table2
				puts "Please Enter a Valid Number."
		end
	end
end

trent_track

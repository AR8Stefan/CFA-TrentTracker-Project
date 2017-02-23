require 'rspotify'
require 'terminal-table'

RSpotify::authenticate("6cd30a3e2da54c3e90182b7890b52041", "8c22bb799dfb49cf8df01b24e40c7eb2")

class Song
  def initialize
    @recommendations = recommendations
  end
  attr_accessor :country, :recommendations

  def recommend(country, genre)
    @country = country
    @recommendations = RSpotify::Recommendations.generate(limit: 5, seed_genres: [genre], market: country).tracks

    # puts "Based on Trent's location: #{country}, Here's a Mixtape:"
    # @recommendations.each do |array_item|
    #   i = 0
    #   puts "\n\nName: #{array_item.name}\nArtist: #{array_item.artists[i].name}\nPlay Song: {#{array_item.external_urls["spotify"]}}"
    #   i += 1
    #   end

    @r_name = []
      @recommendations.each do |array_item|
      @r_name << array_item.name
    end

    # puts "debug: #{@r_name[0]}"

    @r_artist = []
      @recommendations.each do |array_item|
        i = 0
        @r_artist << array_item.artists[i].name
        i = 1
      end
    #puts "debug: #{@r_artist[0]}"

    @r_play_link = []
      @recommendations.each do |array_item|
        @r_play_link << array_item.external_urls["spotify"]
      end
    # puts "debug: #{@r_play_link[0]}"
    display_table(@r_artist, @r_name, @r_play_link)
  end

  def display_table(artist, name, link)
    table = Terminal::Table.new :title => "Mixtape", :headings => ['Artist', 'Name', 'Link'] do |t|
      i = 0
      until i == 5 do
        t.add_row [artist[i], name[i], link[i]]
        i += 1
      end
    end
    puts table.to_s
  end
end

def songstart
def get_country
  country_hash = {'australia'       => 'AU',
                  'phillipines'     => 'PH',
                  'united kingdom'  => 'GB',
                  'uk'              => 'GB',
                  'england'         => 'GB',
                  'united states'   => 'US',
                  'america'         => 'US',
                  'us'              => 'US',
                  'usa'             => 'US',
                  'germany'         => 'DE',
                  'france'          => 'FR',
                  'spain'           => 'ES',
                  'italy'           => 'IT',
                  'new zealand'     => 'NZ',
                 }
  puts "Enter Country:"
  puts "Supported: Australia, Phillipines, United Kingdom, United States,\nGermany, France, Spain, Italy, New Zealand"
  country_input = gets.chomp.downcase
    if country_hash.include?(country_input)
      @country_code = country_hash[country_input]
    else
      puts "Enter a valid country"
      get_country
    end
    return @country_code
end

def get_genre
  @genre_hash_to_description = {'acoustic'      => 'Acoustic Songs',
                               'blues'          => 'Blues music from the Mississipi Delta',
                               'classical'      => 'Classical music from your favorite composers',
                               'disco'          => 'Disco music -- dance like it\'s 1979',
                               'hip-hop'        => 'Hip Hop classics',
                               'philippines-opm'=> 'Original Philipino Music',
                               'pop'            => 'Pop songs to sing along to',
                               'rock'           => 'Great rock songs',
                               'romance'        => 'Songs to set the mood',
                               'soul'           => 'You got soul!',
                               'trip-hop'       => 'Trippy trip-hop songs',
                              }
  puts "Enter Genre:"
  puts "Supported: acoustic, alternative, blues, classical, disco, hip-hop, philippines-opm, pop\nrock, romance, soul, trip-hop"
  @genre = gets.chomp.downcase
    if @genre_hash_to_description.include?(@genre)
      return @genre
    else
      puts "Enter a valid genre"
      get_genre
    end
  return @genre_hash_to_description
end

  get_country
  get_genre

  system 'clear'
  puts "#{@genre} mixtape based on popular songs in #{@country_code} "
  song = Song.new
  song.recommend(@country_code, @genre)

end

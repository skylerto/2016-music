require_relative '2016-spotify.rb'

spot = Spotify::Data.new '2016-spotify.json'
puts spot.artist_chart

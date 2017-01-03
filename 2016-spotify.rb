require 'json'

data = ''
file = File.new('2016-spotify.json', 'r')
while (line = file.gets)
	data = "#{data}\n#{line}"
end
file.close
# puts data

names = []
jason = JSON.parse(data)
jason['items'].each{ |item|
	names << item['name']
}

names.each_with_index { |name, i|
	puts "#{i + 1}. #{name}"
}

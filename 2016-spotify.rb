require 'json'

module Spotify
  class Data
    attr_accessor :data, :names

    def initialize(filename)
      @filename = filename
      @data = self.read_file
      @names = self.fetch_names
    end

    def read_file
      file_contents = ''
      file = File.new(@filename, 'r')
      while (line = file.gets)
	file_contents = "#{file_contents}\n#{line}"
      end
      file.close
      file_contents
    end

    def fetch_names
      if @data
        names = []
        jason = JSON.parse(data)
        jason['items'].each{ |item|
          names << item['name']
        }
      else
        @data = self.read_file
        self.fetch_names
      end
      names
    end

    def artist_chart
      chart = ''
      @names.each_with_index { |name, i|
        chart = "#{chart}#{i + 1}. #{name}\n"
      }
      chart
    end
  end
end

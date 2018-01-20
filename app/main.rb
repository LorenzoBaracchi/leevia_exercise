require_relative 'city.rb'
require_relative 'collection.rb'

module Main

  def self.csv_to_city csv_line
    City.new(name: csv_line[2], country: csv_line[1], altitude: csv_line[5])
  end

  def self.extract_highest cities
    cities.group(:country).map do |country, cts|
      cts.sort.last
    end.sort.reverse!
  end

end

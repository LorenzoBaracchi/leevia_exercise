require_relative 'city.rb'

module Main

  def self.csv_to_city csv_line
    City.new(name: csv_line[2], country: csv_line[1], altitude: csv_line[5])
  end

  def self.group_by cities, attribute
    cities.group_by {|city| city.send(attribute)}
  end
end

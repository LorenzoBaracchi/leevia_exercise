require 'csv'

require_relative 'city.rb'
require_relative 'collection.rb'

module Main

  def self.csv_to_city csv_line
    City.new(name: csv_line[2], country: csv_line[1], altitude: csv_line[5])
  end

  def self.extract_highest cities
    cities.group(:country).map do |_, cts|
      cts.sort.last
    end.sort.reverse!
  end

  def self.run file_name
    csv = CSV.read(file_name, {col_sep: ';'})
    cities = Collection.new(csv.map{|line| csv_to_city line})
    highests = extract_highest cities

    file = File.open("output.txt", "w")
    highests.each do |city|
      puts city
      file.puts city
    end
    file.close
  end

end

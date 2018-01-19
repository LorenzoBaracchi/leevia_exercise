class City
  include Comparable

  attr_reader :name, :country, :altitude

  def initialize(name:, country:, altitude:)
    @name = name
    @country = country
    @altitude = altitude.to_i
  end

  def <=> another_city
    self.altitude <=> another_city.altitude
  end

  def to_s
    "#{altitude}m - #{name}, #{country}"
  end

end

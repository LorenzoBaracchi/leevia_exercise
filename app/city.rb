class City

  attr_reader :name, :country, :altitude

  def initialize(name:, country:, altitude:)
    @name = name
    @country = country
    @altitude = altitude.to_i
  end

  def to_s
    "#{altitude}m - #{name}, #{country}"
  end

end

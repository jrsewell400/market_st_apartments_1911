class Building

  attr_reader :units

  def initialize()
    @units = []
  end

  def add_unit(unit)
    @units << unit
    require "pry"; binding.pry
  end

  def average_rent
    avg_rent = 0
    @units.each do |unit|
      unit.monthly_rent
    end
  end

end

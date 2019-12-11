class Building

  attr_reader :units

  def initialize()
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    avg_rent = 0
    @units.each do |unit|
      avg_rent += unit.monthly_rent
    end
    # require "pry"; binding.pry
    total = avg_rent / @units.count
    total
  end

end

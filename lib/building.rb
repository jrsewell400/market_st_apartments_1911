class Building

  attr_reader :units

  def initialize()
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    avg_rent = 0.0
    @units.each do |unit|
      avg_rent += unit.monthly_rent
    end
    total = avg_rent / @units.count
    total.to_f
  end

  def renter_with_highest_rent
    @units.each do |unit|
      if !(unit = nil)
        #want to check each unit against each other to see which has highest rent?
    end
  end

end

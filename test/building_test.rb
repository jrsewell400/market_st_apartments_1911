require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'
require './lib/apartment'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @unit1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @unit2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @unit3 = Apartment.new({number: "C3", monthly_rent: 1150, bathrooms: 2, bedrooms: 2})
    @unit4 = Apartment.new({number: "D4", monthly_rent: 1500, bathrooms: 3, bedrooms: 2})
    @renter1 = Renter.new("Spencer")
    @renter2 = Renter.new("Jessie")
    @renter2 = Renter.new("Max")
  end

  def test_new_instances_exist
    assert_instance_of Building, @building
    assert_instance_of Apartment, @unit1
    assert_instance_of Apartment, @unit2
  end

  def test_units_starts_as_empty_array
    assert_equal [], @building.units
  end

  def test_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)
    @unit2.add_renter(renter1)

    assert_equal [@unit1, @unit2, @unit3], @building.units
  end

  def test_calculate_avg_monthly_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal 1099.5, @building.average_rent
  end

  def test_renter_with_highest_rent
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    @building.add_unit(@unit3)

    @unit1.add_renter(@renter2)
    assert_equal @renter1, @building.renter_with_highest_rent

    @unit2.add_renter(@renter1)
    assert_equal @renter1, @building.renter_with_highest_rent

    @unit3.add_renter(@renter3)
    assert_equal @renter1, @building.renter_with_highest_rent
  end
end

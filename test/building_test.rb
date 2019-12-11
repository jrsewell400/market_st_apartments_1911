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
  end

  def test_new_instances_exist
    assert_instance_of Building, @building
    assert_instance_of Apartment, @unit1
    assert_instance_of Apartment, @unit2
  end

  def test_units_starts_as_empty_array
    assert_equal [], @building.units
  end

  def test_units_can_be_added
    @building.add_unit(@unit1)
    @building.add_unit(@unit2)
    assert_equal [@unit1, @unit2], @building.units
  end

  def test_calculate_avg_monthly_rent
    assert_equal 1099.5, @building.average_rent
  end
end

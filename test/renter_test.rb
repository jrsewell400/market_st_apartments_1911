require 'minitest/autorun'
require 'minitest/pride'
require './lib/renter'

class RenterTest < Minitest::Test

  def setup
    @renter1 = Renter.new("Jessie")
  end

  def test_a_renter_exists
    assert_instance_of Renter, @renter1
  end

  def test_renter_has_a_name
    assert_equal "Jessie", @renter1.name
  end
end

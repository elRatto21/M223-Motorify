require "test_helper"

class BikeTest < ActiveSupport::TestCase
  def setup
    @team = Team.create!(name: "Test Team")
    @bike = Bike.new(manufacturer: "Yamaha", model: "YZF-R1", horsepower: 200, weight: 200, year: 2022, mileage: 500, team: @team)
  end

  test "should be valid" do
    assert @bike.valid?
  end

  test "should require a manufacturer" do
    @bike.manufacturer = nil
    assert_not @bike.valid?
  end

  test "should require a model" do
    @bike.model = nil
    assert_not @bike.valid?
  end

  test "should belong to a team" do
    assert_equal @team.id, @bike.team_id
  end
end

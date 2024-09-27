require "test_helper"

class ServiceTest < ActiveSupport::TestCase
  def setup
    @team = Team.create!(name: "Test Team")
    @bike = Bike.create!(manufacturer: "Yamaha", model: "YZF-R1", horsepower: 200, weight: 200, year: 2022, mileage: 500, team: @team)
    @service = Service.new(title: "Oil Change", description: "Regular oil change", date: Date.today, bike: @bike, team: @team, mileage: 1000)
  end

  test "should be valid" do
    assert @service.valid?
  end

  test "should require a title" do
    @service.title = nil
    assert_not @service.valid?
  end

  test "should not require a mileage" do
    @service.mileage = nil
    assert @service.valid?
  end

  test "should belong to a bike and team" do
    assert_equal @team.id, @service.team_id
    assert_equal @bike.id, @service.bike_id
  end
end

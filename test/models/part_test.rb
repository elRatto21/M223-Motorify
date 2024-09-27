require "test_helper"

class PartTest < ActiveSupport::TestCase
  def setup
    @team = Team.create!(name: "Test Team")
    @part = Part.new(title: "Brake Pad", description: "High-quality brake pad", price: 50.0, team: @team)
  end

  test "should be valid with valid attributes" do
    assert @part.valid?
  end

  test "should require a title" do
    @part.title = nil
    assert_not @part.valid?
  end

  test "should not require a price" do
    @part.price = nil
    assert @part.valid?
  end

  test "should belong to a team" do
    assert_equal @team.id, @part.team_id
  end
end

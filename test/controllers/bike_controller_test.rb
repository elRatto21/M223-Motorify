require "test_helper"

class BikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Test Team")
    @user = User.create!(name: "Test User", email: "test@example.com", password: "passwordpassword", team: @team)
    @bike = Bike.create!(manufacturer: "Yamaha", model: "YZF-R1", horsepower: 200, weight: 200, year: 2022, mileage: 500, team: @team)
    log_in_as(@user)
  end

  test "should get index" do
    get bikes_path
    assert_response :success
  end

  test "should get new" do
    get new_bike_path
    assert_response :success
  end

  test "should create bike" do
    assert_difference("Bike.count", 1) do
      post bikes_path, params: { bike: { manufacturer: "Honda", model: "CBR", horsepower: 180, weight: 180, year: 2021, mileage: 1000 } }
    end
    assert_redirected_to bikes_path
  end

  test "should show bike" do
    get bike_path(@bike)
    assert_response :success
  end

  test "should get edit" do
    get edit_bike_path(@bike)
    assert_response :success
  end

  test "should update bike" do
    patch bike_path(@bike), params: { bike: { mileage: 800 } }
    assert_redirected_to bikes_path
    @bike.reload
    assert_equal 800, @bike.mileage
  end

  test "should destroy bike" do
    assert_difference("Bike.count", -1) do
      delete bike_path(@bike)
    end
    assert_redirected_to bikes_path
  end
end

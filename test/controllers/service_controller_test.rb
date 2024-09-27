require "test_helper"

class ServicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Test Team")
    @bike = Bike.create!(manufacturer: "Yamaha", model: "YZF-R1", horsepower: 200, weight: 200, year: 2022, mileage: 500, team: @team)
    @service = Service.create!(title: "Oil Change", description: "Regular oil change", date: Date.today, bike: @bike, team: @team, mileage: 1000)
    @user = User.create!(name: "Test User", email: "test@example.com", password: "passwordpassword", team: @team)
    log_in_as(@user)
  end

  test "should get index" do
    get services_path
    assert_response :success
  end

  test "should get new" do
    get new_service_path
    assert_response :success
  end

  test "should create service" do
    assert_difference("Service.count", 1) do
      post services_path, params: { service: { title: "Brake Service", description: "Brake pads replacement", date: Date.today, mileage: 800, bike_id: @bike.id } }
    end
    assert_redirected_to services_path
  end

  test "should show service" do
    get service_path(@service)
    assert_response :success
  end

  test "should get edit" do
    get edit_service_path(@service)
    assert_response :success
  end

  test "should update service" do
    patch service_path(@service), params: { service: { mileage: 1200 } }
    assert_redirected_to services_path
    @service.reload
    assert_equal 1200, @service.mileage
  end

  test "should destroy service" do
    assert_difference("Service.count", -1) do
      delete service_path(@service)
    end
    assert_redirected_to services_path
  end
end

require "test_helper"

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = Team.create!(name: "Test Team")
    @user = User.create!(name: "Test User", email: "test@example.com", password: "passwordpassword", team: @team)
    @part = Part.create!(title: "Brake Pad", description: "High-quality brake pad", price: 50.0, team: @team)
    log_in_as(@user)
  end

  test "should get index" do
    get parts_path
    assert_response :success
  end

  test "should get new" do
    get new_part_path
    assert_response :success
  end

  test "should create part" do
    assert_difference("Part.count", 1) do
      post parts_path, params: { part: { title: "Chain", description: "Durable chain", price: 75.0 } }
    end
    assert_redirected_to parts_path
  end

  test "should show part" do
    get part_path(@part)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_path(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_path(@part), params: { part: { price: 60.0 } }
    assert_redirected_to parts_path
    @part.reload
    assert_equal 60.0, @part.price
  end

  test "should destroy part" do
    assert_difference("Part.count", -1) do
      delete part_path(@part)
    end
    assert_redirected_to parts_path
  end
end

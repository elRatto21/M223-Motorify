require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    # Create the team before assigning it to users
    @team = Team.create!(id: 1, name: "Awesome Team")

    # Create users with and without a team
    @user_with_team = User.create!(email: "user_with_team@example.com", name: "test", password: "passwordpassword", team_id: @team.id)
    @user_without_team = User.create!(email: "user_without_team@example.com", name: "test", password: "passwordpassword", team_id: nil)
  end

  test "should assign team name when user has a team" do
    log_in_as(@user_with_team) # Ensure user with a team is logged in

    get root_path # Assuming the `index` action is mapped to the root path

    assert_response :success
    assert_select "h1", text: "Welcome to Motorify test" # Assuming you're displaying the team name in an h1 tag
  end

  test "should assign 'No team assigned' when user has no team" do
    log_in_as(@user_without_team) # Ensure user without a team is logged in

    get root_path # Assuming the `index` action is mapped to the root path

    assert_response :success
    assert_select "h2", text: "Your team: No team assigned" # Assuming the 'No team assigned' message is in an h1 tag
  end
end

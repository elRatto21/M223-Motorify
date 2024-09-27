require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(email: "test@example.com", password: "passwordpassword", name: "Test User")
    @other_user = User.create!(email: "other@example.com", password: "passwordpassword", name: "Other User")

    # Simulate logging in
    log_in_as(@user)
  end

  test "should get new" do
    # Ensure new user form is accessible
    get new_user_path
    assert_response :success

    # Check that the form for creating a new user exists
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input[name=?]", "user[email]"
      assert_select "input[name=?]", "user[name]"
      assert_select "input[name=?]", "user[password]"
      assert_select "input[name=?]", "user[password_confirmation]"
    end
  end

  test "should create user" do
    # Ensure a new user can be successfully created
    assert_difference("User.count", 1) do
      post users_path, params: { user: { email: "new_user@example.com", password: "passwordpassword", password_confirmation: "passwordpassword", name: "New User" } }
    end
    assert_redirected_to login_path # After creation, should redirect to login
    assert_equal "User created successfully", flash[:notice] # Flash message check
  end

  private

  def log_in_as(user)
    post login_path, params: { session: { email: user.email, password: "passwordpassword" } }
  end
end

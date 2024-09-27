require 'test_helper'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test User", email: "test@example.com", password: "passwordpassword")
  end

  test "should create session" do
    post user_sessions_path, params: { user: { email: @user.email, password: @user.password } }
    assert_redirected_to root_path
  end
end

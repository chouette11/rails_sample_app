require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "should get show" do
    get user_path(users(:michael))
    assert_response :success
  end

  test "should post create" do
    post users_path, params: {user: {
      name: "Example User",
      email: "user@example.com",
      password: "password123",
      password_confirmation: "password123",
    }}
    assert_response :redirect
  end
end

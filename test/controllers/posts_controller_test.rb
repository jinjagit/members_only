require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jinja)
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end

  test "should get new if logged in" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    get new_post_path
    assert_response :success
  end

  test "should redirect new to login if not logged in" do
    delete logout_path
    get new_post_path
    assert_response :redirect
    assert_redirected_to login_path
  end
end

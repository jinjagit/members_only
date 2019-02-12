require 'test_helper'

class PostNewTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:jinja)
  end

  test "invalid new post content(s)" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    get new_post_path
    assert_no_difference 'Post.count' do
      post posts_path, params: { post: { user_id:  @user.id,
                                         title: "     ",
                                         body: "      " } }
    end
    assert_template 'posts/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid new post content(s)" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert is_logged_in?
    get new_post_path
    assert_difference 'Post.count', +1 do
      post posts_path, params: { post: { user_id:  @user.id,
                                         title: "New Post",
                                         body: "The body text." } }
    end
    follow_redirect!
    assert_template 'posts/index'
  end
end

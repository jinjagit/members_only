require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @user = users(:jinja)
    @post = @user.posts.build(title: "title text", body: "body text")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "user id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "title should be present" do
    @post.title = "   "
    assert_not @post.valid?
  end

  test "title should be at most 64 characters" do
    @post.title = "a" * 65
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "   "
    assert_not @post.valid?
  end

  test "body should be at most 1024 characters" do
    @post.body = "a" * 1025
    assert_not @post.valid?
  end
end

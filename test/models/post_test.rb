require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @post = Post.new(title: "This is the title of the post", link: "This is the body of the post")
    get_user_id
  end

  def get_user_id
    @user = User.create(name: "killertuna", email: "valid@email.com")
    @post.user_id = @user.id
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = " "*3
    assert_not @post.valid?
  end

  test "title should not be too long" do
    @post.title = "a"*71
    assert_not @post.valid?
  end

  test "title should not be too short" do
    @post.title = "a"
    assert_not @post.valid?
  end

  test "title should be unique" do
    post_duplicate = @post.dup
    @post.save
    assert_not post_duplicate.valid?
  end

  test "link should be present" do
    @post.link = " "*3
    assert_not @post.valid?
  end

  test "link should not be too long" do
    @post.link = "a"*101
    assert_not @post.valid?
  end

  test "link should not be too short" do
    @post.link = "a"
    assert_not @post.valid?
  end
end

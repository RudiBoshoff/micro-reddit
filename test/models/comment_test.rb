require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @comment = Comment.new(body: "This is a comment")
    get_user_id
    get_post_id
  end

  def get_user_id
    @user = User.create(name: "killertuna", email: "valid@email.com")
    @comment.user_id = @user.id
  end

  def get_post_id
    @post = Post.new(title: "This is the title of the post", link: "This is the body of the post")
    @post.user_id = @user.id
    @post.save
    @comment.post_id = @post.id
  end

  test "should be valid" do
    assert @comment.valid?
  end

  test "body should be present" do
    @comment.body = " "
    assert_not @comment.valid?
  end

   test "body should not be too long" do
    @comment.body = "a"*31
    assert_not @comment.valid?
  end
end

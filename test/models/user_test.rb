require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "KillerTuna", email: "killertuna@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too short" do
    @user.name = 'a'
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a'*22
    assert_not @user.valid?
  end

  test "name should not be blank" do
    @user.name = " "*5
    assert_not @user.valid?
  end

  test "name should be unique" do
    user_duplicate = @user.dup
    @user.save
    assert_not user_duplicate.valid?
  end
  
  test "email should not be blank" do
    @user.email = " "*5
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*247+ "@test.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?
    end

  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]

    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?
    end

  end
end

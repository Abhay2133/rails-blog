require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "TestUser1", email: "testuser1@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "empty name should be invalid" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "empty email shoud be invalid" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "name should be shorter" do
    @user.name = "Abhay " * 100
    assert_not @user.valid?
  end

  test "name should be Larger" do
    @user.name = "a"
    assert_not @user.valid?
  end

  test "Valid emails test" do
    [
      "test@example.com",
      "user.name@domain.co.uk",
      "user+name@sub.domain.com",
      "user_name@domain.io",
      "user-name@domain.org",
      "u123@domain.net",
      "a@b.cc",
      "user@email.travel"
    ].each do |email|
      @user.email = email
      assert @user.valid?, "#{email.inspect} is not valid"
    end
  end

  test "invalid emails tests" do 
    [
      "plainaddress",
      "@missinguser.com",
      "user@.com",
      "user@com",
      "user@domain..com",
      "user@domain.com.",
      "user@domain"
    ].each do |email|
      @user.email = email
      assert_not @user.valid?, "#{email.inspect} is not invalid"
    end
  end
end

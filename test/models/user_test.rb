require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = User.new(name: "ExampleUser", email: "hoge@toki.waseda.jp" )
  end

  test "should be valid " do
    assert @user.valid?
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "  "
    assert_not @user.valid?
  end

  test "name should not be too long" do
    @user.name = "x"*30
    assert @user.valid?
  end

  test "email should be too long" do
    @user.email = "c"* 259 + "@gamil.com"
    assert_not @user.valid?
  end

end

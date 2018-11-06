require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save user without name" do
    user = User.create(first_name: "", last_name: "test", email:"test", password: "test")
    assert_not user.save
  end

  test "should not save user with just spaces as name" do
    user = User.create(first_name: "    ", last_name: "test", email:"test", password: "test")
    assert_not user.save
  end

  test "should not have already used email" do
    User.create(first_name:"test", last_name:"test", email:"test", password:"abcdefg")
    user = User.new(first_name:"test", last_name:"test", email:"test", password:"abcdefg")
    assert_not user.save
  end
end

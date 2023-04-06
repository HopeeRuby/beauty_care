require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save user without name" do
    @user = User.new(email: "anh@gmail.com", active: true, company_id: 1)
    assert_not @user.save, "Saved the user without a name"
  end

  test "should not save user without email" do
    @user = User.new(name: "ngocanh", active: true, company_id: 1)
    assert_not @user.save, "Saved the user without an email"
  end

  test "should not save user without active" do
    @user = User.new(email: "anh@gmail.com", name: "ngocanh", company_id: 1)
    assert_not @user.save, "Saved the user without active"
  end

  test "should not save user without company" do
    @user = User.new(email: "anh@gmail.com", active: true, name: "ngocanh")
    assert_not @user.save, "Saved the user without company"
  end
end
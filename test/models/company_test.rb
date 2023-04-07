require "test_helper"

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save company without name" do
    company = Company.new(location: "ho chi minh")
    assert_not company.save, "Saved the company without a name"
  end
  
  test "should not save company without location" do
    company = Company.new(name: "ngocanh111")
    assert_not user.save, "Saved the company without an location"
  end
end

require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  
  def setup
      @category = Category.new(name: "sports")
  end
  
  test "category should be valid" do
    assert @category.valid?
  end
  
  test "name should be present" do 
    @category.name = " "
    #if this is not valid the test will pass
    assert_not @category.valid?
  end
  
  test "name should be unique" do
    #hits test db
    @category.save
    cat2= Category.new(name: "sports")
    #expect a true a false or nill
    assert_not cat2.valid?
  end
  
  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end
  
  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end
  
  
end
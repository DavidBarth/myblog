require "test_helper"

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    @category = Category.create(name: "sports")
  end
  
  test "Should get categories index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "Should get show" do
    # the show action needs an id, the below line will pass an id 
    get(:show, {'id' => @category.id})
    assert_response :success
  end
  
 
  
end

require "test_helper"

class ArticlesControllerTest < ActionController::TestCase
  
  def setup
    @article = Article.create(title: "some title", description: "this is the description", user_id:2)
  end

  test "Should get articles index" do
    get :index
    assert_response :success
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "Should get show" do
    # the show action needs an id, the below line will pass an id 
    get(:show, {'id' => @article.id})
    assert_response :success
  end

end
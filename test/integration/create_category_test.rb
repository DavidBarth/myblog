require "test_helper"

# integration test business process of creating a category
class CreateCategoriesTest < ActionDispatch::IntegrationTest


  test "get new category form and create category" do
    #emulating user behaviour
    get new_category_path
    assert_template 'categories/new'
    
    #http post request through category path to create action 
    assert_difference "Category.count", 1 do
      #postin a category name
      post_via_redirect categories_path, category: {name: "sports"}
    end
    #sending user to index pages once the category is created
    assert_template "categories/index"
    #expecting to display the string that was passed above 
    assert_match "sports", response.body
  end

end
 
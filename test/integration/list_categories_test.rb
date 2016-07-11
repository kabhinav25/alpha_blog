require 'test_helper'
class ListCategoriestest<ActionDispatch::IntegrationTest
  def setup
    @category=Category.create(name:"sports")
    @category2=Category.create(name:"program")
  end
  test "should show category listing" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]",category_path(@category),text:@category.name
    assert_select "a[href=?]",category_path(@category2),text:@category2.name
    end
end
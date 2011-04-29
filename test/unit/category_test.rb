require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
    setup do
    @category = {
      :category    => 'Movie'
    }
    @category2 = Category.new(@category)
    @category2.save
  end
  test "Category attributes must not be empty" do
    category = Category.new
    assert category.invalid?
    assert category.errors[:category].any?
  end
  
  test "Category is not valid without a unique category - i18n" do
    category = Category.new(:category    => @category2.category)
    assert !category.save
    assert_equal "has already been taken", category.errors[:category].join('; ')
  end
end

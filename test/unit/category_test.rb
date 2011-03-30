require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Category attributes must not be empty" do
    category = Category.new
    assert category.invalid?
    assert category.errors[:category].any?
  end
  
  test "Category is not valid without a unique category - i18n" do
    category = Category.new(:category    => categories(:one).category)
    assert !category.save
    assert_equal "has already been taken", category.errors[:category].join('; ')
  end
end

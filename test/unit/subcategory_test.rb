require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "SubCategory attributes must not be empty" do
    subcategory = Subcategory.new
    assert subcategory.invalid?
    assert subcategory.errors[:categories_id].any?
    assert subcategory.errors[:subcategory].any?
  end
end

require 'test_helper'

class SubcategoryTest < ActiveSupport::TestCase
  
  test "SubCategory attributes must not be empty" do
    subcategory = Subcategory.new
    assert subcategory.invalid?
    assert subcategory.errors[:categories_id].any?
    assert subcategory.errors[:subcategory].any?
  end
  
  test "Categories_id must not be negative" do
    subcategory = Subcategory.new( :subcategory => "Tools")
                           
    subcategory.categories_id = -1
    assert subcategory.invalid?
    assert subcategory.errors[:categories_id].any?
    
  end
  
  test "Categories_id must be greater than 0" do
    subcategory = Subcategory.new( :subcategory => "Tools")
                           
    subcategory.categories_id = 0
    assert subcategory.invalid?
    assert subcategory.errors[:categories_id].any?
    
  end
  
  test "Categories_id must be a positive integer" do
    subcategory = Subcategory.new( :subcategory => "Tools")
   
    subcategory.categories_id = 1
    assert subcategory.valid?
  end
end
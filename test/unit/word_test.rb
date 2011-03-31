require 'test_helper'

class WordTest < ActiveSupport::TestCase
  
  test "Word attributes must not be empty" do
    word = Word.new
    assert word.invalid?
    assert word.errors[:subcategories_id].any?
    assert word.errors[:word].any?
    assert word.errors[:hint].any?
  end
  
  test "Subcategories_id must not be negative" do
    word = Word.new( :word => "Test Word",
                     :hint => "Just a test",
                     :points => "15",
                     :button_score => "10",
                     :letter_seq => "111101111101111110111101111")                      
    
    word.subcategories_id = -1
    assert word.invalid?
    assert word.errors[:subcategories_id].any?
  end
  
  test "Subcategories_id must be greater than 0" do
    word = Word.new( :word => "Test Word",
                     :hint => "Just a test",
                     :points => "15",
                     :button_score => "10",
                     :letter_seq => "111101111101111110111101111")                      
    
    word.subcategories_id = 0
    assert word.invalid?
    assert word.errors[:subcategories_id].any?
  end
  
  test "Subcategories_id must be positive" do
    word = Word.new( :word => "Test Word",
                     :hint => "Just a test",
                     :points => "15",
                     :button_score => "10",
                     :letter_seq => "111101111101111110111101111")                     
    
    word.subcategories_id = 1
    assert word.valid?    
  end
  
end
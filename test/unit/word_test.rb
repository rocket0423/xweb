require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Word attributes must not be empty" do
    word = Word.new
    assert word.invalid?
    assert word.errors[:subcategories_id].any?
    assert word.errors[:word].any?
    assert word.errors[:hint].any?
  end
end

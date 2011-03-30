require 'test_helper'

class HangManTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "hang_man attributes must not be empty" do
    hangman = HangMan.new
    assert hangman.invalid?
    assert hangman.errors[:name].any?
    assert hangman.errors[:hang1_url].any?
    assert hangman.errors[:hang2_url].any?
    assert hangman.errors[:hang3_url].any?
    assert hangman.errors[:hang4_url].any?
    assert hangman.errors[:hang5_url].any?
    assert hangman.errors[:hang6_url].any?
    assert hangman.errors[:hang7_url].any?
  end
  
  def new_hangman(image_url)
    HangMan.new(:name       => "Title",
                :hang1_url  => image_url,
                :hang2_url  => image_url,
                :hang3_url  => image_url,
                :hang4_url  => image_url,
                :hang5_url  => image_url,
                :hang6_url  => image_url,
                :hang7_url  => image_url)
  end
  
  test "image url" do
    ok = %w{george.gif george.jpg george.png GEORGE.JPG GEORGE.Jpg http://a.b.c/x/y/z/george.gif}
    bad = %w{george.doc george.gif/more george.gif.more }
    ok.each do |name|
      assert new_hangman(name).valid?, "#{name} shouldn't be invalid"
    end
    bad.each do |name|
      assert new_hangman(name).invalid?, "#{name} shouldn't be valid"
    end
    
  end
  
  test "HangMan is not valid without a unique name - i18n" do
    hang = HangMan.new(:name      => hang_men(:one).name,
                       :hang1_url  => 'image_url.jpg',
                       :hang2_url  => 'image_url.jpg',
                       :hang3_url  => 'image_url.jpg',
                       :hang4_url  => 'image_url.jpg',
                       :hang5_url  => 'image_url.jpg',
                       :hang6_url  => 'image_url.jpg',
                       :hang7_url  => 'image_url.jpg')
    assert !hang.save
    assert_equal "has already been taken", hang.errors[:name].join('; ')
  end
  
end

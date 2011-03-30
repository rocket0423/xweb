class HangMan < ActiveRecord::Base
  validates :name, :hang1_url, :hang2_url, :hang3_url, :hang4_url, :hang5_url, :hang6_url, :hang7_url, :presence => true
  validates :name, :uniqueness => true
  validates :hang1_url, :hang2_url, :hang3_url, :hang4_url, :hang5_url, :hang6_url, :hang7_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a URL for GIF, JPG or PNG image.'
  }
end

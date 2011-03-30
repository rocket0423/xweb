class Category < ActiveRecord::Base
  has_many :subcategories
  validates :category, :presence => true
  validates :category, :uniqueness => true
end

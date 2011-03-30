class Category < ActiveRecord::Base
  has_many :subcategories
  validates :category, :presence => true
  validates :title, :uniqueness => true
end

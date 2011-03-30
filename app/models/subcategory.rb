class Subcategory < ActiveRecord::Base
  belongs_to :Category
  has_many :words
  validates :subcategory, :categories_id, :presence => true
  validates_uniqueness_of :subcategory, :scope => :categories_id
end

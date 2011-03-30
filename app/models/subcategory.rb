class Subcategory < ActiveRecord::Base
  belongs_to :Category
  has_many :words
  validates :categories_id, :subcategory, :presence => true
  validates :categories_id, :numericality => {:greater_than => 0}
end

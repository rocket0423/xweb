class Subcategory < ActiveRecord::Base
  belongs_to :Category
  has_many :words
end

class Word < ActiveRecord::Base
  belongs_to :Subcategory
  validates :subcategories_id, :word, :hint, :presence => true
  validates_uniqueness_of :word, :scope => :subcategories_id
end

class AddButtonScoreToWords < ActiveRecord::Migration
  def self.up
    add_column :words, :button_score, :integer
    add_column :words, :letter_seq, :string
  end

  def self.down
    remove_column :words, :letter_seq
    remove_column :words, :button_score
  end
end

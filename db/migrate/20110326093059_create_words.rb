class CreateWords < ActiveRecord::Migration
  def self.up
    create_table :words do |t|
      t.integer :subcategories_id
      t.string :word
      t.string :hint
      t.integer :points

      t.timestamps
    end
  end

  def self.down
    drop_table :words
  end
end

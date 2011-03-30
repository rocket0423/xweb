class AddNameToHangMen < ActiveRecord::Migration
  def self.up
    add_column :hang_men, :name, :string
  end

  def self.down
    remove_column :hang_men, :name
  end
end

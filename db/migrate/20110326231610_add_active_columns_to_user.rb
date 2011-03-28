class AddActiveColumnsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :active, :string
    add_column :users, :active2, :string
    add_column :users, :hangman_id, :integer
    add_column :users, :word_id, :integer
  end

  def self.down
    remove_column :users, :word_id
    remove_column :users, :hangman_id
    remove_column :users, :active2
    remove_column :users, :active
  end
end

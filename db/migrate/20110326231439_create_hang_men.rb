class CreateHangMen < ActiveRecord::Migration
  def self.up
    create_table :hang_men do |t|
      t.string :hang1_url
      t.string :hang2_url
      t.string :hang3_url
      t.string :hang4_url
      t.string :hang5_url
      t.string :hang6_url
      t.string :hang7_url

      t.timestamps
    end
  end

  def self.down
    drop_table :hang_men
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110329220355) do

  create_table "categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hang_men", :force => true do |t|
    t.string   "hang1_url"
    t.string   "hang2_url"
    t.string   "hang3_url"
    t.string   "hang4_url"
    t.string   "hang5_url"
    t.string   "hang6_url"
    t.string   "hang7_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "subcategories", :force => true do |t|
    t.integer  "categories_id"
    t.string   "subcategory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "administrator"
    t.string   "active"
    t.string   "active2"
    t.integer  "hangman_id"
    t.integer  "word_id"
    t.integer  "score"
  end

  create_table "words", :force => true do |t|
    t.integer  "subcategories_id"
    t.string   "word"
    t.string   "hint"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "button_score"
    t.string   "letter_seq"
  end

end

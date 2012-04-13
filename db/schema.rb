# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20111130173921) do

  create_table "chars", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "script_id"
    t.integer  "glyph_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "chars", ["ancestry"], :name => "ancestry"

  create_table "chars_sounds", :id => false, :force => true do |t|
    t.integer "char_id"
    t.integer "sound_id"
  end

  create_table "glyphs", :force => true do |t|
    t.string   "unicode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.string   "author"
    t.string   "publisher"
    t.string   "title"
    t.integer  "year"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scripts", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "beginDate"
    t.string   "endDate"
  end

  create_table "sounds", :force => true do |t|
    t.string   "symbol"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.string   "file"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                              :default => "", :null => false
    t.string   "encrypted_password",  :limit => 128, :default => "", :null => false
    t.datetime "remember_created_at"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

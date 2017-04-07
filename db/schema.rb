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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170407021300) do

  create_table "boxes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "resolution", null: false
    t.string  "address",    null: false
  end

  create_table "levels", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "box_id",     null: false
    t.integer  "level",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["box_id"], name: "index_levels_on_box_id", using: :btree
  end

  add_foreign_key "levels", "boxes", on_delete: :cascade
end

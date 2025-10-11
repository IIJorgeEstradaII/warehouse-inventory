# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_11_043942) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "item_locations", force: :cascade do |t|
    t.bigint "sku_id"
    t.bigint "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_item_locations_on_location_id"
    t.index ["sku_id"], name: "index_item_locations_on_sku_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "location", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skus", force: :cascade do |t|
    t.string "description", null: false
    t.string "part_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "qty", null: false
    t.check_constraint "qty > 0", name: "qty_non_negative_non_zero"
  end

  add_foreign_key "item_locations", "locations"
  add_foreign_key "item_locations", "skus"
end

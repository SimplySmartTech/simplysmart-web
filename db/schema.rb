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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_091616) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_testimonials", force: :cascade do |t|
    t.string "testimonial", default: "-"
    t.string "name", default: "-"
    t.string "designation", default: "-"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_testimonials_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", default: "-"
    t.string "logo_image", default: "-"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "client_testimonials", "clients"
end

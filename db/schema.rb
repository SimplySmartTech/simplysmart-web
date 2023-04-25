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

ActiveRecord::Schema[7.0].define(version: 2022_09_06_103842) do
  create_table "attachments", force: :cascade do |t|
    t.string "attachment_url"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "attachment_type"
    t.index ["service_id"], name: "index_attachments_on_service_id"
  end

  create_table "client_testimonials", force: :cascade do |t|
    t.string "testimonial", default: "-"
    t.string "name", default: "-"
    t.string "designation", default: "-"
    t.integer "client_id"
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

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_features_on_service_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "service_name"
    t.string "service_info"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "attachments", "services"
  add_foreign_key "client_testimonials", "clients"
  add_foreign_key "features", "services"
end

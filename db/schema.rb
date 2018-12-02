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

ActiveRecord::Schema.define(version: 2018_12_01_180102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "houses", force: :cascade do |t|
    t.string "address"
    t.integer "user_id"
    t.integer "city_id"
    t.string "cover_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_houses_on_city_id"
    t.index ["user_id"], name: "index_houses_on_user_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "house_id"
    t.integer "month"
    t.integer "year"
    t.integer "status"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_invoices_on_house_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.jsonb "preferences"
    t.string "address"
    t.integer "house_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_owners_on_house_id"
  end

  create_table "service_records", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "service_id"
    t.integer "house_id"
    t.decimal "cached_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "total", precision: 10, scale: 2, default: "0.0"
    t.decimal "value", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_service_records_on_house_id"
    t.index ["invoice_id"], name: "index_service_records_on_invoice_id"
    t.index ["service_id"], name: "index_service_records_on_service_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "house_id"
    t.integer "service_type_id"
    t.integer "status"
    t.date "active_from"
    t.date "inactive_from"
    t.decimal "price", precision: 10, scale: 2, default: "0.0"
    t.boolean "use_price_as_default_fee", default: false
    t.boolean "relevant", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["house_id"], name: "index_services_on_house_id"
    t.index ["service_type_id"], name: "index_services_on_service_type_id"
  end

end

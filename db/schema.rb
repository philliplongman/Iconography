# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_13_053222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name", "user_id"], name: "index_campaigns_on_name_and_user_id", unique: true
    t.index ["user_id"], name: "index_campaigns_on_user_id"
  end

  create_table "domains", force: :cascade do |t|
    t.string "name"
    t.bigint "campaign_id", null: false
    t.index ["campaign_id"], name: "index_domains_on_campaign_id"
    t.index ["name", "campaign_id"], name: "index_domains_on_name_and_campaign_id", unique: true
  end

  create_table "icons", force: :cascade do |t|
    t.bigint "campaign_id", null: false
    t.string "name", null: false
    t.string "summary", limit: 1000
    t.string "quote"
    t.text "usual_location"
    t.text "common_knowledge"
    t.text "adventurers"
    t.text "allies"
    t.text "enemies"
    t.text "history"
    t.text "true_danger"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["campaign_id"], name: "index_icons_on_campaign_id"
    t.index ["name", "campaign_id"], name: "index_icons_on_name_and_campaign_id", unique: true
  end

  create_table "icons_domains", force: :cascade do |t|
    t.bigint "icon_id", null: false
    t.bigint "domain_id", null: false
    t.index ["domain_id"], name: "index_icons_domains_on_domain_id"
    t.index ["icon_id", "domain_id"], name: "index_icons_domains_on_icon_id_and_domain_id", unique: true
    t.index ["icon_id"], name: "index_icons_domains_on_icon_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "campaigns", "users", on_delete: :cascade
  add_foreign_key "domains", "campaigns", on_delete: :cascade
  add_foreign_key "icons", "campaigns", on_delete: :cascade
  add_foreign_key "icons_domains", "domains", on_delete: :cascade
  add_foreign_key "icons_domains", "icons", on_delete: :cascade
end

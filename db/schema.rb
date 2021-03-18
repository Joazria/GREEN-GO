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

ActiveRecord::Schema.define(version: 2021_01_28_192733) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bands", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.text "release"
    t.string "website"
    t.string "facebook"
    t.string "instagram"
    t.string "youtube"
    t.string "soundcloud"
    t.string "spotify"
    t.string "email"
    t.string "local"
    t.integer "team"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "yt_video_one"
    t.string "yt_video_two"
    t.string "yt_video_three"
    t.string "yt_video_destak"
    t.string "destak_discr"
    t.string "headline"
    t.string "city"
    t.string "state"
    t.string "country"
    t.index ["user_id"], name: "index_bands_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.string "favoritable_type", null: false
    t.bigint "favoritable_id", null: false
    t.string "favoritor_type", null: false
    t.bigint "favoritor_id", null: false
    t.string "scope", default: "favorite", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blocked"], name: "index_favorites_on_blocked"
    t.index ["favoritable_id", "favoritable_type"], name: "fk_favoritables"
    t.index ["favoritable_type", "favoritable_id"], name: "index_favorites_on_favoritable_type_and_favoritable_id"
    t.index ["favoritor_id", "favoritor_type"], name: "fk_favorites"
    t.index ["favoritor_type", "favoritor_id"], name: "index_favorites_on_favoritor_type_and_favoritor_id"
    t.index ["scope"], name: "index_favorites_on_scope"
  end

  create_table "festivals", force: :cascade do |t|
    t.string "fb"
    t.string "insta"
    t.string "site"
    t.string "name"
    t.date "periode_start"
    t.date "periode_end"
    t.string "release"
    t.string "line_up"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "tel"
    t.string "festival_name"
    t.string "address"
    t.bigint "user_id"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_festivals_on_user_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.bigint "band_id", null: false
    t.date "date"
    t.string "gate_opening"
    t.string "showtime"
    t.string "duration"
    t.string "local"
    t.string "address"
    t.string "state"
    t.string "country"
    t.string "website"
    t.text "release"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["band_id"], name: "index_gigs_on_band_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "event_name"
    t.string "local"
    t.text "release"
    t.integer "fee"
    t.date "date"
    t.time "show_time"
    t.string "line_up"
    t.bigint "user_id", null: false
    t.bigint "band_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "format"
    t.string "patrocino"
    t.string "link_do_event"
    t.string "address"
    t.string "transport"
    t.string "accommodation"
    t.string "perdiem"
    t.string "backline"
    t.string "ticket"
    t.string "capacity"
    t.string "streaming"
    t.index ["band_id"], name: "index_offers_on_band_id"
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.bigint "searchable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.string "fb"
    t.string "insta"
    t.string "site"
    t.string "venue"
    t.string "email"
    t.string "tel"
    t.string "address"
    t.string "venue_name"
    t.string "name"
    t.string "release"
    t.string "line_up"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_venues_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bands", "users"
  add_foreign_key "festivals", "users"
  add_foreign_key "gigs", "bands"
  add_foreign_key "offers", "bands"
  add_foreign_key "offers", "users"
  add_foreign_key "venues", "users"
end

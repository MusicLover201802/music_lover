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


ActiveRecord::Schema.define(version: 20180327115428) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "admin_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "destinations", force: :cascade do |t|
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "building"
    t.string "phone_number", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_destinations_on_first_name"
    t.index ["first_name_kana"], name: "index_destinations_on_first_name_kana"
    t.index ["last_name"], name: "index_destinations_on_last_name"
    t.index ["last_name_kana"], name: "index_destinations_on_last_name_kana"
    t.index ["user_id"], name: "index_destinations_on_user_id"
  end

  create_table "discs", force: :cascade do |t|
    t.string "disc_name", null: false
    t.integer "disc_num", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_discs_on_item_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_name"], name: "index_genres_on_genre_name"
  end

  create_table "items", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "artist_name", null: false
    t.string "artist_name_kana", null: false
    t.integer "genre_id", null: false
    t.integer "price", null: false
    t.string "label_name"
    t.integer "stock", null: false
    t.date "release_date", null: false
    t.boolean "purchase_flag", null: false
    t.integer "admin_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "jacket_image_id"
    t.index ["admin_id"], name: "index_items_on_admin_id"
    t.index ["artist_name"], name: "index_items_on_artist_name"
    t.index ["artist_name_kana"], name: "index_items_on_artist_name_kana"
    t.index ["genre_id"], name: "index_items_on_genre_id"
    t.index ["item_name"], name: "index_items_on_item_name"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "quantity", null: false
    t.integer "price", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_order_items_on_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "building"
    t.string "phone_number", null: false
    t.string "payment", null: false
    t.string "status", default: "商品準備中", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["first_name"], name: "index_orders_on_first_name"
    t.index ["first_name_kana"], name: "index_orders_on_first_name_kana"
    t.index ["last_name"], name: "index_orders_on_last_name"
    t.index ["last_name_kana"], name: "index_orders_on_last_name_kana"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.integer "disc_id", null: false
    t.string "track_name", null: false
    t.integer "track_num", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["disc_id"], name: "index_tracks_on_disc_id"
  end

  create_table "user_items", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.integer "quantity", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_user_items_on_item_id"
    t.index ["user_id"], name: "index_user_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "last_name", null: false
    t.string "first_name", null: false
    t.string "last_name_kana", null: false
    t.string "first_name_kana", null: false
    t.string "postal_code", null: false
    t.integer "prefecture", null: false
    t.string "city", null: false
    t.string "building"
    t.string "phone_number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "retire_flag", default: false
    t.datetime "soft_destroyed_at"
    t.index ["email", "soft_destroyed_at"], name: "index_users_on_email_and_soft_destroyed_at", unique: true
    t.index ["first_name"], name: "index_users_on_first_name"
    t.index ["first_name_kana"], name: "index_users_on_first_name_kana"
    t.index ["last_name"], name: "index_users_on_last_name"
    t.index ["last_name_kana"], name: "index_users_on_last_name_kana"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["soft_destroyed_at"], name: "index_users_on_soft_destroyed_at"
  end

end

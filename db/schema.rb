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

ActiveRecord::Schema[7.0].define(version: 2022_05_24_225658) do
  create_table "friends", force: :cascade do |t|
    t.string "email"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "group_friends", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "friend_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_group_friends_on_friend_id"
    t.index ["group_id"], name: "index_group_friends_on_group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "order_partispants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["order_id"], name: "index_order_partispants_on_order_id"
    t.index ["user_id"], name: "index_order_partispants_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total"
    t.string "order_type"
    t.string "restaurant_name"
    t.string "img"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_auths", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "friends", "users"
  add_foreign_key "group_friends", "friends"
  add_foreign_key "group_friends", "groups"
  add_foreign_key "groups", "users"
  add_foreign_key "order_partispants", "orders"
  add_foreign_key "order_partispants", "users"
  add_foreign_key "orders", "users"
end

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

ActiveRecord::Schema.define(version: 2020_03_08_235539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "passage_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["passage_id"], name: "index_comments_on_passage_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["uuid"], name: "index_comments_on_uuid", unique: true
  end

  create_table "passages", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "ref", null: false
    t.bigint "text_id", null: false
    t.text "passage", null: false
    t.integer "rank", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text_id", "rank"], name: "index_passages_on_text_id_and_rank", unique: true
    t.index ["text_id", "ref"], name: "index_passages_on_text_id_and_ref", unique: true
    t.index ["text_id"], name: "index_passages_on_text_id"
    t.index ["uuid"], name: "index_passages_on_uuid", unique: true
  end

  create_table "texts", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.string "urn", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["urn"], name: "index_texts_on_urn", unique: true
    t.index ["uuid"], name: "index_texts_on_uuid", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.citext "email", null: false
    t.string "name", null: false
    t.string "password_digest", null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["uuid"], name: "index_users_on_uuid", unique: true
  end

  add_foreign_key "comments", "passages"
  add_foreign_key "comments", "users"
  add_foreign_key "passages", "texts"
end

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

ActiveRecord::Schema.define(version: 2020_03_21_163704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "comments", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "reference_id", null: false
    t.bigint "user_id", null: false
    t.text "comment", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reference_id"], name: "index_comments_on_reference_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
    t.index ["uuid"], name: "index_comments_on_uuid", unique: true
  end

  create_table "editions", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "text_id", null: false
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text_id"], name: "index_editions_on_text_id"
    t.index ["uuid"], name: "index_editions_on_uuid", unique: true
  end

  create_table "passages", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "edition_id", null: false
    t.bigint "reference_id", null: false
    t.text "passage", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["edition_id", "reference_id"], name: "index_passages_on_edition_id_and_reference_id", unique: true
    t.index ["edition_id"], name: "index_passages_on_edition_id"
    t.index ["reference_id"], name: "index_passages_on_reference_id"
    t.index ["uuid"], name: "index_passages_on_uuid", unique: true
  end

  create_table "references", force: :cascade do |t|
    t.uuid "uuid", default: -> { "gen_random_uuid()" }, null: false
    t.bigint "text_id", null: false
    t.string "ref", null: false
    t.integer "rank", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["text_id", "rank"], name: "index_references_on_text_id_and_rank", unique: true
    t.index ["text_id", "ref"], name: "index_references_on_text_id_and_ref", unique: true
    t.index ["text_id"], name: "index_references_on_text_id"
    t.index ["uuid"], name: "index_references_on_uuid", unique: true
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

  add_foreign_key "comments", "\"references\"", column: "reference_id"
  add_foreign_key "comments", "users"
  add_foreign_key "editions", "texts"
  add_foreign_key "passages", "\"references\"", column: "reference_id"
  add_foreign_key "passages", "editions"
  add_foreign_key "references", "texts"
end

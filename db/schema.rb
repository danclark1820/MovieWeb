# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140424120508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                       null: false
    t.string   "year",                        null: false
    t.string   "url",                         null: false
    t.boolean  "unknown",     default: false, null: false
    t.boolean  "action",      default: false, null: false
    t.boolean  "adventure",   default: false, null: false
    t.boolean  "animation",   default: false, null: false
    t.boolean  "childrens",   default: false, null: false
    t.boolean  "comedy",      default: false, null: false
    t.boolean  "crime",       default: false, null: false
    t.boolean  "documentary", default: false, null: false
    t.boolean  "drama",       default: false, null: false
    t.boolean  "fantasy",     default: false, null: false
    t.boolean  "filmnoir",    default: false, null: false
    t.boolean  "horror",      default: false, null: false
    t.boolean  "musical",     default: false, null: false
    t.boolean  "mystery",     default: false, null: false
    t.boolean  "romance",     default: false, null: false
    t.boolean  "scifi",       default: false, null: false
    t.boolean  "thriller",    default: false, null: false
    t.boolean  "war",         default: false, null: false
    t.boolean  "western",     default: false, null: false
    t.integer  "seed_id"
  end

  add_index "movies", ["url"], name: "index_movies_on_url", unique: true, using: :btree

  create_table "ratings", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.integer  "stars",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["user_id", "movie_id"], name: "index_ratings_on_user_id_and_movie_id", unique: true, using: :btree

  create_table "recommendations", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "movie_id",   null: false
    t.integer  "score",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seed_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

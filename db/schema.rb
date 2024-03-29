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

ActiveRecord::Schema.define(version: 2019_10_22_182536) do

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_lists", force: :cascade do |t|
    t.integer "list_id"
    t.integer "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_movie_lists_on_list_id"
    t.index ["movie_id"], name: "index_movie_lists_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "year"
    t.string "poster"
    t.string "genre"
    t.integer "rating"
    t.string "imdb_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

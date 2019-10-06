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

ActiveRecord::Schema.define(version: 2019_10_06_140409) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.integer "abv"
    t.boolean "isOrganic"
    t.string "category"
    t.text "description"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.integer "rating_num"
    t.text "review"
    t.index ["beer_id"], name: "index_ratings_on_beer_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.text "about_me"
    t.string "password_digest"
  end

  add_foreign_key "ratings", "beers"
  add_foreign_key "ratings", "users"
end

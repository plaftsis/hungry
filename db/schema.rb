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

ActiveRecord::Schema.define(version: 2022_01_14_202929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "budgets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "difficulties", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.tsvector "searchable", default: -> { "to_tsvector('french'::regconfig, (name)::text)" }
    t.index ["searchable"], name: "index_ingredients_on_searchable", using: :gin
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "people_quantity"
    t.float "rate"
    t.integer "prep_time_in_minutes"
    t.integer "cook_time_in_minutes"
    t.integer "total_time_in_minutes"
    t.string "image"
    t.integer "number_of_comments"
    t.bigint "author_id", null: false
    t.bigint "difficulty_id", null: false
    t.bigint "budget_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_recipes_on_author_id"
    t.index ["budget_id"], name: "index_recipes_on_budget_id"
    t.index ["difficulty_id"], name: "index_recipes_on_difficulty_id"
  end

  create_table "recipes_ingredients", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "ingredient_id", null: false
    t.index ["ingredient_id"], name: "index_recipes_ingredients_on_ingredient_id"
    t.index ["recipe_id"], name: "index_recipes_ingredients_on_recipe_id"
  end

  create_table "recipes_tags", id: false, force: :cascade do |t|
    t.bigint "recipe_id", null: false
    t.bigint "tag_id", null: false
    t.index ["recipe_id"], name: "index_recipes_tags_on_recipe_id"
    t.index ["tag_id"], name: "index_recipes_tags_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "recipes", "authors"
  add_foreign_key "recipes", "budgets"
  add_foreign_key "recipes", "difficulties"
  add_foreign_key "recipes_ingredients", "ingredients"
  add_foreign_key "recipes_ingredients", "recipes"
  add_foreign_key "recipes_tags", "recipes"
  add_foreign_key "recipes_tags", "tags"
end

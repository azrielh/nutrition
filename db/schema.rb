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

ActiveRecord::Schema.define(version: 20150519160106) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sort"
  end

  create_table "categorizations", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id", using: :btree
  add_index "categorizations", ["recipe_id"], name: "index_categorizations_on_recipe_id", using: :btree

  create_table "directions", force: :cascade do |t|
    t.integer  "step"
    t.text     "instruction"
    t.integer  "recipe_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "directions", ["recipe_id"], name: "index_directions_on_recipe_id", using: :btree

  create_table "inclusions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "inclusions", ["ingredient_id"], name: "index_inclusions_on_ingredient_id", using: :btree
  add_index "inclusions", ["recipe_id"], name: "index_inclusions_on_recipe_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.integer  "nutrient_databank_number"
    t.string   "name"
    t.string   "unit"
    t.float    "qty"
    t.float    "calories"
    t.float    "total_fat"
    t.float    "saturated_fat"
    t.float    "trans_fat"
    t.float    "cholesterol"
    t.float    "sodium"
    t.float    "total_carbs"
    t.float    "dietary_fiber"
    t.float    "sugars"
    t.float    "protein"
    t.float    "vitamin_a"
    t.float    "vitamin_c"
    t.float    "calcium"
    t.float    "iron"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.float    "serving_weight"
    t.string   "nutritionix_id"
    t.integer  "recipe_id"
  end

  add_index "ingredients", ["recipe_id"], name: "index_ingredients_on_recipe_id", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "image"
    t.float    "calories"
    t.float    "total_fat"
    t.float    "saturated_fat"
    t.float    "trans_fat"
    t.float    "cholesterol"
    t.float    "sodium"
    t.float    "total_carbs"
    t.float    "dietary_fiber"
    t.float    "sugars"
    t.float    "protein"
    t.float    "vitamin_a"
    t.float    "vitamin_c"
    t.float    "calcium"
    t.float    "iron"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "servings"
    t.float    "total_weight"
    t.decimal  "price"
  end

  add_index "recipes", ["category_id"], name: "index_recipes_on_category_id", using: :btree
  add_index "recipes", ["user_id"], name: "index_recipes_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "rest_name"
  end

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "recipes"
  add_foreign_key "directions", "recipes"
  add_foreign_key "inclusions", "ingredients"
  add_foreign_key "inclusions", "recipes"
  add_foreign_key "ingredients", "recipes"
  add_foreign_key "recipes", "categories"
  add_foreign_key "recipes", "users"
end

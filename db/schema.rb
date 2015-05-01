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

ActiveRecord::Schema.define(version: 20150501015151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
  end

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
  end

  create_table "usda_food_groups", id: false, force: :cascade do |t|
    t.string   "code",        null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_food_groups", ["code"], name: "index_usda_food_groups_on_code", using: :btree

  create_table "usda_foods", id: false, force: :cascade do |t|
    t.string   "nutrient_databank_number", null: false
    t.string   "food_group_code"
    t.string   "long_description",         null: false
    t.string   "short_description",        null: false
    t.string   "common_names"
    t.string   "manufacturer_name"
    t.boolean  "survey"
    t.string   "refuse_description"
    t.string   "scientific_name"
    t.integer  "percentage_refuse"
    t.float    "nitrogen_factor"
    t.float    "protein_factor"
    t.float    "fat_factor"
    t.float    "carbohydrate_factor"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_foods", ["food_group_code"], name: "index_usda_foods_on_food_group_code", using: :btree
  add_index "usda_foods", ["nutrient_databank_number"], name: "index_usda_foods_on_nutrient_databank_number", using: :btree

  create_table "usda_foods_nutrients", force: :cascade do |t|
    t.string   "nutrient_databank_number",     null: false
    t.string   "nutrient_number",              null: false
    t.float    "nutrient_value",               null: false
    t.integer  "num_data_points",              null: false
    t.float    "standard_error"
    t.string   "src_code",                     null: false
    t.string   "derivation_code"
    t.string   "ref_nutrient_databank_number"
    t.boolean  "add_nutrient_mark"
    t.integer  "num_studies"
    t.float    "min"
    t.float    "max"
    t.integer  "degrees_of_freedom"
    t.float    "lower_error_bound"
    t.float    "upper_error_bound"
    t.string   "statistical_comments"
    t.string   "add_mod_date"
    t.string   "confidence_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_foods_nutrients", ["nutrient_databank_number", "nutrient_number"], name: "foods_nutrients_index", using: :btree

  create_table "usda_footnotes", force: :cascade do |t|
    t.string   "nutrient_databank_number", null: false
    t.string   "footnote_number",          null: false
    t.string   "footnote_type",            null: false
    t.string   "nutrient_number"
    t.string   "footnote_text",            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_footnotes", ["footnote_number"], name: "index_usda_footnotes_on_footnote_number", using: :btree
  add_index "usda_footnotes", ["footnote_type"], name: "index_usda_footnotes_on_footnote_type", using: :btree
  add_index "usda_footnotes", ["nutrient_databank_number"], name: "index_usda_footnotes_on_nutrient_databank_number", using: :btree
  add_index "usda_footnotes", ["nutrient_number"], name: "index_usda_footnotes_on_nutrient_number", using: :btree

  create_table "usda_nutrients", id: false, force: :cascade do |t|
    t.string   "nutrient_number",       null: false
    t.string   "units",                 null: false
    t.string   "tagname"
    t.string   "nutrient_description",  null: false
    t.string   "number_decimal_places", null: false
    t.integer  "sort_record_order",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_nutrients", ["nutrient_number"], name: "index_usda_nutrients_on_nutrient_number", using: :btree

  create_table "usda_source_codes", force: :cascade do |t|
    t.string   "code",        null: false
    t.string   "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_source_codes", ["code"], name: "index_usda_source_codes_on_code", using: :btree

  create_table "usda_weights", force: :cascade do |t|
    t.string   "nutrient_databank_number", null: false
    t.string   "sequence_number",          null: false
    t.float    "amount",                   null: false
    t.string   "measurement_description",  null: false
    t.float    "gram_weight",              null: false
    t.integer  "num_data_points"
    t.float    "standard_deviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usda_weights", ["nutrient_databank_number"], name: "index_usda_weights_on_nutrient_databank_number", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "categorizations", "categories"
  add_foreign_key "categorizations", "recipes"
  add_foreign_key "directions", "recipes"
  add_foreign_key "inclusions", "ingredients"
  add_foreign_key "inclusions", "recipes"
end

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

ActiveRecord::Schema.define(version: 20180213072447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "industry"
    t.string "company"
    t.string "company_type"
    t.integer "story_id"
    t.string "precedent_career"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ini_career_path"
    t.string "sub_career_path"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.string "company"
    t.string "industry"
    t.string "company_type"
    t.string "age"
    t.integer "career_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "topic"
    t.string "author"
    t.string "slug"
    t.string "meta_name"
    t.string "meta_content"
    t.index ["slug"], name: "index_posts_on_slug", unique: true
  end

  create_table "stories", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "linkedin_url"
    t.integer "ini_age"
    t.integer "sub_age"
    t.string "ini_title"
    t.string "ini_career_path"
    t.string "ini_industry"
    t.string "ini_company"
    t.string "ini_company_type"
    t.text "sumary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.text "quote"
    t.string "education"
    t.string "meta_name"
    t.string "meta_content"
    t.index ["slug"], name: "index_stories_on_slug", unique: true
  end

  create_table "story_questions", force: :cascade do |t|
    t.integer "story_id"
    t.string "question"
    t.text "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "career_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

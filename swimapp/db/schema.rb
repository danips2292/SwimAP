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

ActiveRecord::Schema.define(version: 20170907085156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admins_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "tip_group"
    t.string   "schedule"
  end

  create_table "initial_forms", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "legal_id"
    t.string   "tec_id"
    t.string   "name"
    t.string   "carreer"
    t.date     "start_year"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "workplace"
    t.string   "study_address"
    t.string   "father_name"
    t.string   "mother_name"
    t.string   "home_address"
    t.string   "accident_name"
    t.string   "accident_telephone"
    t.string   "accident_comment"
    t.string   "accident_address"
    t.boolean  "team_history"
    t.boolean  "team_accomplishments"
    t.string   "semester"
    t.string   "current_year"
    t.integer  "height_cm"
    t.integer  "weight"
    t.string   "doctor_name"
    t.string   "blood_type"
    t.boolean  "deasease"
    t.boolean  "hospitalized"
    t.boolean  "surgery"
    t.boolean  "meds"
    t.boolean  "vitamins"
    t.boolean  "allergies"
    t.boolean  "bruises"
    t.boolean  "faints"
    t.boolean  "dizziness"
    t.boolean  "chestpain"
    t.boolean  "headeache"
    t.boolean  "cholesterol"
    t.boolean  "heart_studies"
    t.boolean  "heartattack_related"
    t.boolean  "skin_problems"
    t.boolean  "concussion"
    t.boolean  "memory_loss"
    t.boolean  "convulsions"
    t.boolean  "tingles"
    t.boolean  "cough"
    t.boolean  "eye_problems"
    t.boolean  "sprains"
    t.boolean  "diabetes"
    t.boolean  "pregnant"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["user_id"], name: "index_initial_forms_on_user_id", using: :btree
  end

  create_table "posts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.text     "text"
  end

  create_table "routines", force: :cascade do |t|
    t.string   "distance"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end

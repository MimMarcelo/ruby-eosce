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

ActiveRecord::Schema.define(version: 2021_07_30_173033) do

  create_table "answers", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "choice_id", null: false
    t.text "open_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.integer "question_id", null: false
    t.text "body"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.integer "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.text "resume"
    t.boolean "fixed_station_sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "station_template_questions", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "station_template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_station_template_questions_on_question_id"
    t.index ["station_template_id"], name: "index_station_template_questions_on_station_template_id"
  end

  create_table "station_templates", force: :cascade do |t|
    t.string "name"
    t.text "resume"
    t.text "procedure"
    t.text "evaluation"
    t.integer "score"
    t.integer "minutes"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "answers", "choices"
  add_foreign_key "answers", "questions"
  add_foreign_key "choices", "questions"
  add_foreign_key "station_template_questions", "questions"
  add_foreign_key "station_template_questions", "station_templates"
end

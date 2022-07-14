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

ActiveRecord::Schema.define(version: 2022_07_14_114042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "choice_id", null: false
    t.text "open_answer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["choice_id"], name: "index_answers_on_choice_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "choices", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.text "body"
    t.boolean "correct"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_choices_on_question_id"
  end

  create_table "exam_answers", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.string "student_name"
    t.string "student_email"
    t.string "student_number_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["exam_id"], name: "index_exam_answers_on_exam_id"
  end

  create_table "exam_applies", force: :cascade do |t|
    t.bigint "exam_id", null: false
    t.string "student_name"
    t.string "student_email"
    t.string "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "station_turn"
    t.index ["exam_id"], name: "index_exam_applies_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_exams_on_schedule_id"
    t.index ["user_id"], name: "index_exams_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "body"
    t.integer "kind"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedule_stations", force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "station_template_id", null: false
    t.integer "score"
    t.integer "level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_schedule_stations_on_schedule_id"
    t.index ["station_template_id"], name: "index_schedule_stations_on_station_template_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "name"
    t.text "resume"
    t.boolean "fixed_station_sequence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "station_applies", force: :cascade do |t|
    t.bigint "exam_apply_id", null: false
    t.string "time_left"
    t.boolean "finished"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "station_template_id", null: false
    t.index ["exam_apply_id"], name: "index_station_applies_on_exam_apply_id"
    t.index ["station_template_id"], name: "index_station_applies_on_station_template_id"
  end

  create_table "station_template_questions", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "station_template_id", null: false
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
    t.integer "feedback"
  end

  create_table "user_schedules", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "schedule_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "owner"
    t.index ["schedule_id"], name: "index_user_schedules_on_schedule_id"
    t.index ["user_id"], name: "index_user_schedules_on_user_id"
  end

  create_table "user_station_templates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "station_template_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "owner"
    t.index ["station_template_id"], name: "index_user_station_templates_on_station_template_id"
    t.index ["user_id"], name: "index_user_station_templates_on_user_id"
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
  add_foreign_key "exam_answers", "exams"
  add_foreign_key "exam_applies", "exams"
  add_foreign_key "exams", "schedules"
  add_foreign_key "exams", "users"
  add_foreign_key "schedule_stations", "schedules"
  add_foreign_key "schedule_stations", "station_templates"
  add_foreign_key "station_applies", "exam_applies"
  add_foreign_key "station_applies", "station_templates"
  add_foreign_key "station_template_questions", "questions"
  add_foreign_key "station_template_questions", "station_templates"
  add_foreign_key "user_schedules", "schedules"
  add_foreign_key "user_schedules", "users"
  add_foreign_key "user_station_templates", "station_templates"
  add_foreign_key "user_station_templates", "users"
end

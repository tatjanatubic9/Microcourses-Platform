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

ActiveRecord::Schema.define(version: 20160616144618) do

  create_table "answer_comments", force: :cascade do |t|
    t.text     "description"
    t.integer  "quiz_result_id"
    t.integer  "quiz_answer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "answer_comments", ["quiz_answer_id"], name: "index_answer_comments_on_quiz_answer_id"
  add_index "answer_comments", ["quiz_result_id"], name: "index_answer_comments_on_quiz_result_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "courses", ["user_id"], name: "index_courses_on_user_id"

  create_table "lessons", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "link"
    t.integer  "course_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id"

  create_table "pending_quizzes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "graded"
  end

  add_index "pending_quizzes", ["quiz_id"], name: "index_pending_quizzes_on_quiz_id"
  add_index "pending_quizzes", ["user_id"], name: "index_pending_quizzes_on_user_id"

  create_table "questions", force: :cascade do |t|
    t.integer  "nb"
    t.text     "description"
    t.integer  "quiz_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "questions", ["quiz_id"], name: "index_questions_on_quiz_id"

  create_table "quiz_answers", force: :cascade do |t|
    t.integer  "pending_quiz_id"
    t.integer  "question_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "answer"
  end

  add_index "quiz_answers", ["pending_quiz_id"], name: "index_quiz_answers_on_pending_quiz_id"
  add_index "quiz_answers", ["question_id"], name: "index_quiz_answers_on_question_id"

  create_table "quiz_results", force: :cascade do |t|
    t.integer  "grade"
    t.integer  "user_id"
    t.integer  "pending_quiz_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "quiz_results", ["pending_quiz_id"], name: "index_quiz_results_on_pending_quiz_id"
  add_index "quiz_results", ["user_id"], name: "index_quiz_results_on_user_id"

  create_table "quizzes", force: :cascade do |t|
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quizzes", ["course_id"], name: "index_quizzes_on_course_id"

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "role"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["course_id"], name: "index_votes_on_course_id"
  add_index "votes", ["user_id"], name: "index_votes_on_user_id"

end

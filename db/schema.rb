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

ActiveRecord::Schema.define(version: 20180429084748) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "professor_ratings", force: :cascade do |t|
    t.bigint "professor_id"
    t.bigint "subject_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rate"
    t.text "review_detail"
    t.index ["professor_id"], name: "index_professor_ratings_on_professor_id"
    t.index ["student_id"], name: "index_professor_ratings_on_student_id"
    t.index ["subject_id"], name: "index_professor_ratings_on_subject_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_professors_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["status_id"], name: "index_students_on_status_id"
  end

  create_table "subject_professor_students", force: :cascade do |t|
    t.bigint "subject_professor_id"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_subject_professor_students_on_student_id"
    t.index ["subject_professor_id"], name: "index_subject_professor_students_on_subject_professor_id"
  end

  create_table "subject_professors", force: :cascade do |t|
    t.bigint "subject_id"
    t.bigint "professor_id"
    t.bigint "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_subject_professors_on_professor_id"
    t.index ["status_id"], name: "index_subject_professors_on_status_id"
    t.index ["subject_id"], name: "index_subject_professors_on_subject_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "subject_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_id"
    t.string "sid"
    t.index ["status_id"], name: "index_subjects_on_status_id"
  end

  add_foreign_key "professor_ratings", "professors"
  add_foreign_key "professor_ratings", "students"
  add_foreign_key "professor_ratings", "subjects"
  add_foreign_key "professors", "statuses"
  add_foreign_key "students", "statuses"
  add_foreign_key "subject_professor_students", "students"
  add_foreign_key "subject_professor_students", "subject_professors"
  add_foreign_key "subject_professors", "professors"
  add_foreign_key "subject_professors", "statuses"
  add_foreign_key "subject_professors", "subjects"
  add_foreign_key "subjects", "statuses"
end

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

ActiveRecord::Schema.define(version: 20151209184218) do

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

  create_table "csv_imports", force: :cascade do |t|
    t.integer  "file_size"
    t.integer  "row_count"
    t.string   "file_name",                            null: false
    t.integer  "progress",     default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "stage",        default: "initialized"
    t.string   "csv_file_uid"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",               default: 0, null: false
    t.integer  "attempts",               default: 0, null: false
    t.text     "handler",                            null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.integer  "delayed_reference_id"
    t.string   "delayed_reference_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["delayed_reference_id"], name: "delayed_jobs_delayed_reference_id", using: :btree
  add_index "delayed_jobs", ["delayed_reference_type"], name: "delayed_jobs_delayed_reference_type", using: :btree
  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  add_index "delayed_jobs", ["queue"], name: "delayed_jobs_queue", using: :btree

  create_table "interactions", force: :cascade do |t|
    t.integer  "response_set"
    t.integer  "response_id",                    null: false
    t.integer  "parent_response_id"
    t.datetime "date_time"
    t.string   "page"
    t.string   "question"
    t.string   "response"
    t.string   "optional_text"
    t.string   "user"
    t.string   "branch"
    t.string   "desk"
    t.string   "library"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.date     "count_date"
    t.integer  "day_of_week"
    t.integer  "day_of_month"
    t.integer  "day_of_year"
    t.integer  "hour_of_day"
    t.integer  "year"
    t.integer  "month"
    t.integer  "data_quality",       default: 2
  end

  add_index "interactions", ["count_date"], name: "index_interactions_on_count_date", using: :btree
  add_index "interactions", ["data_quality"], name: "index_interactions_on_data_quality", using: :btree
  add_index "interactions", ["date_time"], name: "index_interactions_on_date_time", using: :btree
  add_index "interactions", ["page"], name: "index_interactions_on_page", using: :btree
  add_index "interactions", ["response_id"], name: "index_interactions_on_response_id", unique: true, using: :btree
  add_index "interactions", ["user"], name: "index_interactions_on_user", using: :btree

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
    t.integer  "role",                   default: 1
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

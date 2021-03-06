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

ActiveRecord::Schema.define(version: 20170416143312) do

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "project_users", force: :cascade do |t|
    t.integer  "project_id",   limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "project_role", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "project_users", ["project_id"], name: "index_project_users_on_project_id", using: :btree
  add_index "project_users", ["user_id"], name: "index_project_users_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "abbr_name",       limit: 255
    t.string   "name",            limit: 255
    t.string   "proj_types",      limit: 255
    t.datetime "proj_start_time"
    t.datetime "proj_end_time"
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "projects", ["abbr_name"], name: "index_projects_on_abbr_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "email",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "actived",                   default: true
    t.datetime "deleted_at"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

  create_table "users_groups", id: false, force: :cascade do |t|
    t.integer  "group_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "users_groups", ["group_id"], name: "index_users_groups_on_group_id", using: :btree
  add_index "users_groups", ["user_id"], name: "index_users_groups_on_user_id", using: :btree

end

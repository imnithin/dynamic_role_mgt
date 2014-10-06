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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140605063810) do

  create_table "data_entries", :force => true do |t|
    t.integer  "node_id"
    t.integer  "role_id"
    t.string   "field_type"
    t.string   "name"
    t.string   "location"
    t.integer  "rank"
    t.boolean  "multi"
    t.boolean  "must_fill"
    t.string   "update_db"
    t.string   "select_db"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "decisions", :force => true do |t|
    t.integer  "node_id"
    t.string   "criteria"
    t.string   "value1"
    t.string   "value2"
    t.string   "value3"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "flows", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "information", :force => true do |t|
    t.integer  "node_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "js_editors", :force => true do |t|
    t.integer  "data_entry_id"
    t.string   "js_event"
    t.string   "js_code"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "nodes", :force => true do |t|
    t.integer  "flow_id"
    t.string   "name"
    t.integer  "node_id_parent"
    t.integer  "duration"
    t.integer  "node_id_task_starter"
    t.boolean  "parent_value"
    t.string   "node_type"
    t.integer  "role_id"
    t.string   "sql"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "permission_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permission_methods", :force => true do |t|
    t.string   "name"
    t.integer  "permission_class_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "permitted_roles", :force => true do |t|
    t.integer  "role_id"
    t.integer  "permission_method_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "role_alternatives", :force => true do |t|
    t.integer  "role_id"
    t.integer  "role_id_alt"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "user_id_source"
    t.string   "date_due"
    t.date     "date_created"
    t.integer  "user_id_created"
    t.date     "date_completed"
    t.integer  "user_id_completed"
    t.integer  "node_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "role_id"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vacations", :force => true do |t|
    t.integer  "user_id"
    t.string   "description"
    t.date     "start_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

end

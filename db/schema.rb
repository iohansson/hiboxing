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

ActiveRecord::Schema.define(:version => 20140124212251) do

  create_table "coaches", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "events", :force => true do |t|
    t.integer  "group_id"
    t.integer  "day"
    t.time     "start"
    t.time     "stop"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "price"
    t.string   "description"
    t.integer  "num_trainings"
    t.integer  "days"
  end

  create_table "gyms", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.float    "latitude"
    t.float    "longitude"
    t.time     "opens_at"
    t.time     "closes_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "images", :force => true do |t|
    t.string   "data"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "news_items", :force => true do |t|
    t.string   "title"
    t.string   "text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sportsmen", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "user_id"
  end

  add_index "sportsmen", ["user_id"], :name => "index_sportsmen_on_user_id"

  create_table "subs", :force => true do |t|
    t.integer  "sportsman_id"
    t.integer  "group_id"
    t.integer  "trainings_left"
    t.date     "until_date"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "points"
    t.integer  "level"
  end

  add_index "subs", ["group_id"], :name => "index_subs_on_group_id"
  add_index "subs", ["sportsman_id"], :name => "index_subs_on_sportsman_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "admin"
  end

  create_table "visits", :force => true do |t|
    t.integer  "sub_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "day"
  end

  add_index "visits", ["sub_id"], :name => "index_visits_on_sub_id"

end

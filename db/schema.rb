# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091006185152) do

  create_table "behaviors", :force => true do |t|
    t.integer  "behavior_id",                        :null => false
    t.string   "behavior_description", :limit => 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "breadcrumbs", :force => true do |t|
    t.decimal  "latitude",   :precision => 10, :scale => 7
    t.decimal  "longitude",  :precision => 10, :scale => 7
    t.integer  "user_id",                                   :null => false
    t.datetime "created_at"
  end

  create_table "complaints", :force => true do |t|
    t.integer  "user_id",                     :null => false
    t.integer  "defendant_id",                :null => false
    t.string   "reason",       :limit => 160
    t.integer  "event_id",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", :force => true do |t|
    t.string   "event_type_name", :limit => 50, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_id",                                          :null => false
    t.integer  "event_type_id",                                    :null => false
    t.integer  "participant_id"
    t.string   "content",        :limit => 160
    t.boolean  "delivered",                     :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friends", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "friend_id",  :null => false
    t.boolean  "friendly",   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "user_id",                                           :null => false
    t.string   "image_location",                                    :null => false
    t.string   "image_description", :limit => 50
    t.boolean  "sharing",                         :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interaction_categories", :force => true do |t|
    t.integer  "user_id",                                                       :null => false
    t.string   "interaction_category_description", :limit => 50,                :null => false
    t.integer  "show_flag",                                      :default => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interactions", :force => true do |t|
    t.integer  "user_id",                                                  :null => false
    t.integer  "interaction_category_id",                                  :null => false
    t.integer  "behavior_id",                            :default => 1,    :null => false
    t.string   "description",             :limit => 50
    t.string   "content",                 :limit => 320
    t.boolean  "enabled",                                :default => true, :null => false
    t.integer  "image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
  end

end

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

ActiveRecord::Schema.define(version: 20_170_607_111_250) do
  create_table 'admins', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.string   'profile_picture'
    t.text     'about'
  end

  add_index 'admins', ['email'], name: 'index_admins_on_email', unique: true
  add_index 'admins', ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true

  create_table 'categories', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'images', force: :cascade do |t|
    t.string   'image'
    t.string   'image_title'
    t.string   'image_description'
    t.string   'image_file_size'
    t.string   'image_content_type'
    t.integer  'category_id'
    t.datetime 'created_at',                         null: false
    t.datetime 'updated_at',                         null: false
    t.boolean  'front_page_image'
    t.boolean  'landscape', default: false
  end

  add_index 'images', ['category_id'], name: 'index_images_on_category_id'

  create_table 'messages', force: :cascade do |t|
    t.string   'name'
    t.string   'email'
    t.text     'message'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end

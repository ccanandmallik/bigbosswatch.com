# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_220_730_005_910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'companies', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'post_flags', force: :cascade do |t|
    t.bigint 'post_id', null: false
    t.integer 'flag_type'
    t.string 'user_ip'
    t.string 'user_agent'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['post_id'], name: 'index_post_flags_on_post_id'
  end

  create_table 'posts', force: :cascade do |t|
    t.text 'content', null: false
    t.string 'user_ip'
    t.string 'user_agent'
    t.bigint 'company_id', null: false
    t.integer 'media_type', array: true
    t.integer 'location_type', array: true
    t.integer 'device_type', array: true
    t.integer 'certainty_type', array: true
    t.integer 'intent_type', array: true
    t.integer 'maturity_type', array: true
    t.boolean 'approved', default: false, null: false
    t.boolean 'processed', default: false, null: false
    t.boolean 'is_akismet_blatant'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'policy_comm_type', array: true
    t.index ['company_id'], name: 'index_posts_on_company_id'
  end

  add_foreign_key 'post_flags', 'posts'
  add_foreign_key 'posts', 'companies'
end

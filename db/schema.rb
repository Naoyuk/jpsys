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

ActiveRecord::Schema.define(version: 20_210_213_194_001) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'customers', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.string 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name'
    t.integer 'price'
    t.integer 'stock'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'lists', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'item_id'
    t.integer 'amount'
    t.integer 'list_price'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'discount', default: 0
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'order_number'
    t.integer 'customer_id'
    t.float 'gst'
    t.float 'pst'
    t.float 'total'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.date 'order_date'
    t.date 'payment_date'
  end

  create_table 'purchases', force: :cascade do |t|
    t.integer 'supplier_id'
    t.string 'item_name'
    t.integer 'amount'
    t.float 'price'
    t.float 'cad'
    t.integer 'jpy'
    t.string 'payment_method'
    t.text 'note'
    t.date 'order_date'
    t.date 'payment_date'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.float 'exchangerate'
  end

  create_table 'suppliers', force: :cascade do |t|
    t.string 'name'
    t.string 'representative'
    t.string 'email'
    t.string 'address'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'password_digest'
    t.index ['email'], name: 'index_users_on_email', unique: true
  end
end

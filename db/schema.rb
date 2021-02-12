# frozen_string_literal: true

ActiveRecord::Schema.define(version: 20_200_805_184_819) do
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
end

# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :order_number
      t.integer :customer_id
      t.float :gst
      t.float :pst
      t.float :total

      t.timestamps
    end
  end
end

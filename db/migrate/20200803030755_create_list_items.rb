# frozen_string_literal: true

class CreateListItems < ActiveRecord::Migration[6.0]
  def change
    create_table :list_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :amount
      t.integer :list_price

      t.timestamps
    end
  end
end

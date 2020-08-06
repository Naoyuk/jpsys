class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.integer :supplier_id
      t.string :item_name
      t.integer :amount
      t.float :price
      t.float :cad
      t.integer :jpy
      t.string :payment_method
      t.text :note
      t.date :order_date
      t.date :payment_date

      t.timestamps
    end
  end
end

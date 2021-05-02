class CreateLines < ActiveRecord::Migration[6.1]
  def change
    create_table :lines do |t|
      t.integer :purchase_id
      t.string :title
      t.integer :price
      t.integer :quantity
      t.integer :discount

      t.timestamps
    end
  end
end

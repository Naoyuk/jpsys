class CreateExchanges < ActiveRecord::Migration[6.1]
  def change
    create_table :exchanges do |t|
      t.string :currency
      t.float :rate

      t.timestamps
    end
  end
end

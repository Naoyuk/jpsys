# frozen_string_literal: true

class CreateSuppliers < ActiveRecord::Migration[6.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :representative
      t.string :email
      t.string :address

      t.timestamps
    end
  end
end

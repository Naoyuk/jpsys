# frozen_string_literal: true

class AddCulmunPurchases < ActiveRecord::Migration[6.0]
  def change
    add_column :purchases, :exchangerate, :float
  end
end

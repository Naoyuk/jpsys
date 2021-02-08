# frozen_string_literal: true

class AddColumnListItems < ActiveRecord::Migration[6.0]
  def change
    add_column :list_items, :discount, :integer
  end
end

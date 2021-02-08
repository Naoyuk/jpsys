# frozen_string_literal: true

class ChangeListitemsToLists < ActiveRecord::Migration[6.0]
  def change
    rename_table :list_items, :lists
  end
end

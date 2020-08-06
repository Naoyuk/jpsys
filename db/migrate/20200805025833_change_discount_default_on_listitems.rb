class ChangeDiscountDefaultOnListitems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :list_items, :discount, from: nil, to: 0
  end
end

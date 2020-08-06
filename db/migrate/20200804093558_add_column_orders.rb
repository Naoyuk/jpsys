class AddColumnOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :order_date, :date
    add_column :orders, :payment_date, :date
  end
end

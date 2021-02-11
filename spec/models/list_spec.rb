require 'rails_helper'

RSpec.describe List, type: :model do
  pending "is valid with an order_id, an item_id, an amount, a list price" do
    order = Order.new(
      order_number: "1001",
      # TODO: リレーションによる外部キー制約のテストにもパスするように書く
      )
    list = order.build(
      # TODO: OrderとItemに紐付くように書く
    )
  end
end

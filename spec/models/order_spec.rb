# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @order = @customer.orders.build
  end

  it 'is valid with an order number and order date' do
    @order.order_number = '123'
    @order.order_date = Date.today
    expect(@order).to be_valid
  end

  it 'is invalid without order number' do
    @order.order_number = nil
    @order.valid?
    expect(@order.errors[:order_number]).to include("can't be blank")
  end

  it 'is invalid without order date' do
    @order.order_date = nil
    @order.valid?
    expect(@order.errors[:order_date]).to include("can't be blank")
  end

  it 'calculate total sales' do
    item1 = Item.create(
      name: 'test1',
      price: 10,
      stock: 10
    )
    item2 = Item.create(
      name: 'test2',
      price: 13,
      stock: 10
    )

    @order.order_number = '123'
    @order.order_date = Date.today
    @order.save

    other_order = @customer.orders.build(
      order_number: '124',
      order_date: Date.today
    )
    other_order.save

    main_order_list1 = @order.lists.build(
      item_id: item1.id,
      amount: 2,
      discount: 0
    )
    main_order_list1.save

    main_order_list2 = @order.lists.build(
      item_id: item2.id,
      amount: 3,
      discount: 0
    )
    main_order_list2.save

    other_order_list1 = other_order.lists.build(
      item_id: item1.id,
      amount: 1,
      discount: 0
    )
    other_order_list1.save

    other_order_list2 = other_order.lists.build(
      item_id: item2.id,
      amount: 4,
      discount: 0
    )
    other_order_list2.save

    expect(Order.all.total_sales).to eq 121
  end
end

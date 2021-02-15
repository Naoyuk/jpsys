require 'rails_helper'

RSpec.describe Order, type: :model do

  before do
    @customer = Customer.create(
      name: 'test',
      email: 'test@example.com',
      address: '1234 Abc Street'
    )
    @order = @customer.orders.build
  end

  it "is valid with an order number and order date" do
    @order.order_number = '123'
    @order.order_date = Date.today
    expect(@order).to be_valid
  end

  it "is invalid without order number" do
    @order.order_number = nil
    @order.valid?
    expect(@order.errors[:order_number]).to include("can't be blank")
  end

  it "is invalid without order date" do
    @order.order_date = nil
    @order.valid?
    expect(@order.errors[:order_date]).to include("can't be blank")
  end

  it "calculate total order price" do
    item1 = Item.create(
      name: 'test',
      price: 10,
      stock: 10
    )
    item2 = Item.create(
      name: 'test',
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
      list_price: 10,
      discount: 0
    )
    main_order_list1.save

    main_order_list2 = @order.lists.build(
      item_id: item2.id,
      amount: 3,
      list_price: 13,
      discount: 0
    )
    main_order_list2.save

    other_order_list1 = other_order.lists.build(
      item_id: item1.id,
      amount: 1,
      list_price: 10,
      discount: 0
    )
    other_order_list1.save

    other_order_list2 = other_order.lists.build(
      item_id: item2.id,
      amount: 4,
      list_price: 13,
      discount: 0
    )
    other_order_list2.save

    expect(Order.total_order).to eq 121

    # orders = Order.all
    # expect(orders.total).to eq 121
    
    # expect(Order.total).to eq 121
  end

end

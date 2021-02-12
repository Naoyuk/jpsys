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

end

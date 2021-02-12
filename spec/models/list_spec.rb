require 'rails_helper'

RSpec.describe List, type: :model do

  before do
    @customer = Customer.create(
      name: 'test',
      email: 'test@example.com',
      address: '1234 Abc Street'
    )
    @item = Item.create(
      name: 'test',
      price: 15,
      stock: 20
    )
    @order = @customer.orders.build
    @list = @order.lists.build
  end

  it "is valid with an order_id, an item_id, an amount, a list price" do
    @list.item_id = @item.id
    @list.amount = 5
    @list.list_price = 15
    expect(@list).to be_valid
  end

  it "is invalid without item_id" do
    @list.item_id = nil
    @list.valid?
    expect(@list.errors[:item_id]).to include("cannot be blank")
  end

  it "is invalid without amount" do
    @list.amount = nil
    @list.valid?
    expect(@list.errors[:amount]).to include("can't be blank")
  end

  it "is invalid without list price" do
    @list.list_price = nil
    @list.valid?
    expect(@list.errors[:list_price]).to include("can't be blank")
  end

  it "is invalid if amount = -1" do
    @list.amount = -1
    @list.valid?
    expect(@list.errors[:amount]).to include("must be greater than 0")
  end

  it "is invalid if amount = 0" do
    @list.amount = 0
    @list.valid?
    expect(@list.errors[:amount]).to include("must be greater than 0")
  end

  it "is valid if amount = 1" do
    @list.item_id = @item.id
    @list.amount = 1
    @list.list_price = 15
    expect(@list).to be_valid
  end

  it "is invalid if list_price = -1" do
    @list.list_price = -1
    @list.valid?
    expect(@list.errors[:list_price]).to include("must be greater than 0")
  end

  it "is invalid if list_price = 0" do
    @list.list_price = 0
    @list.valid?
    expect(@list.errors[:list_price]).to include("must be greater than 0")
  end

  it "is valid if list_price = 1" do
    @list.item_id = @item.id
    @list.amount = 1
    @list.list_price = 1
    expect(@list).to be_valid
  end

end

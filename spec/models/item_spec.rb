require 'rails_helper'

RSpec.describe Item, type: :model do

  it "is valid with a name, price, and stock" do
    item = Item.new(
      name: "test item1",
      price: 10,
      stock: 20,
    )
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item = Item.new(name: nil)
    item.valid?
    expect(item.errors[:name]).to  include("can't be blank")
  end

  it "is invalid without a price" do
    item = Item.new(price: nil)
    item.valid?
    expect(item.errors[:price]).to  include("can't be blank")
  end

  it "is valid with a price value 1" do
    item = Item.new(name: "test", price: 1, stock: 10)
    expect(item).to be_valid
  end

  it "is invalid with a price value o" do
    item = Item.new(name: "test", price: 0, stock: 10)
    item.valid?
    expect(item.errors[:price]).to include("must be greater than 0")
  end

  it "is invalid with a price value -1" do
    item = Item.new(name: "test", price: -1, stock: 10)
    item.valid?
    expect(item.errors[:price]).to include("must be greater than 0")
  end

  it "is invalid without a stock" do
    item = Item.new(stock: nil)
    item.valid?
    expect(item.errors[:stock]).to  include("can't be blank")
  end

end

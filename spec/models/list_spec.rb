# frozen_string_literal: true

require 'rails_helper'

RSpec.describe List, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @item = FactoryBot.create(:item)
    @order = @customer.orders.build
    @list = @order.lists.build
  end

  it 'is valid with an order_id, an item_id, an amount, a list price' do
    @list.item_id = @item.id
    @list.amount = 5
    expect(@list).to be_valid
  end

  it 'is invalid without item_id' do
    @list.item_id = nil
    @list.valid?
    expect(@list.errors[:item_id]).to include('cannot be blank')
  end

  it 'is invalid without amount' do
    @list.amount = nil
    @list.valid?
    expect(@list.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid if amount = -1' do
    @list.amount = -1
    @list.valid?
    expect(@list.errors[:amount]).to include('must be greater than 0')
  end

  it 'is invalid if amount = 0' do
    @list.amount = 0
    @list.valid?
    expect(@list.errors[:amount]).to include('must be greater than 0')
  end

  it 'is valid if amount = 1' do
    @list.item_id = @item.id
    @list.amount = 1
    expect(@list).to be_valid
  end

  it 'calculate subtotal with an amount' do
    @list.item_id = @item.id
    @list.amount = 1
    expect(@list.subtotal).to eq 12
  end

  it 'calculate subtotal with 2 amounts' do
    @list.item_id = @item.id
    @list.amount = 2
    expect(@list.subtotal).to eq 24
  end

  it 'calculate subtotal with 0 amount' do
    @list.item_id = @item.id
    @list.amount = 0
    expect(@list.subtotal).to eq 0
  end
end

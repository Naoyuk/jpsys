require 'rails_helper'

RSpec.describe Line, type: :model do
  before do
    @supplier = FactoryBot.create(:supplier)
    @purchase = @supplier.purchases.build
    @purchase.order_date = Date.today
    @purchase.payment_date = Date.today
    @purchase.exchangerate = 1.23
    @purchase.save
    @line = @purchase.lines.build
    @line.purchase_id = @purchase.id
  end

  it 'is valid with an purchase_id, a quantity, a price' do
    @line.quantity = 5
    @line.price = 15
    expect(@line).to be_valid
  end

  it 'is invalid without price' do
    @line.quantity = 1
    @line.price = nil
    @line.valid?
    expect(@line.errors[:price]).to include("can't be blank")
  end

  it 'is invalid if price = -1' do
    @line.quantity = 1
    @line.price = -1
    @line.valid?
    expect(@line.errors[:price]).to include('must be greater than 0')
  end

  it 'is invalid if price = 0' do
    @line.quantity = 1
    @line.price = 0
    @line.valid?
    expect(@line.errors[:price]).to include('must be greater than 0')
  end

  it 'is valid if price = 1' do
    @line.quantity = 1
    @line.price = 1
    expect(@line).to be_valid
  end

  it 'is invalid without quantity' do
    @line.quantity = nil
    @line.price = 15
    @line.valid?
    expect(@line.errors[:quantity]).to include("can't be blank")
  end

  it 'is invalid if quantity = -1' do
    @line.quantity = -1
    @line.price = 15
    @line.valid?
    expect(@line.errors[:quantity]).to include('must be greater than 0')
  end

  it 'is invalid if quantity = 0' do
    @line.quantity = 0
    @line.price = 15
    @line.valid?
    expect(@line.errors[:quantity]).to include('must be greater than 0')
  end

  it 'is valid if quantity = 1' do
    @line.quantity = 1
    @line.price = 15
    expect(@line).to be_valid
  end

  it 'calculate subtotal with one quantity and discount' do
    @line.quantity = 1
    @line.price = 15
    @line.discount = 1
    expect(@line.subtotal).to eq 14
  end

  it 'calculate subtotal with 2 quantity and discount' do
    @line.quantity = 2
    @line.price = 15
    @line.discount = 1
    expect(@line.subtotal).to eq 29
  end
end

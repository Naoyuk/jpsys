# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @supplier = FactoryBot.create(:supplier)
    @purchase = @supplier.purchases.build
  end

  it 'is valid with supplier_id, order_date, payment_date, and exchangerate' do
    @purchase.order_date = Date.today
    @purchase.payment_date = Date.today
    @purchase.exchangerate = 1.23
    expect(@purchase).to be_valid
  end

  it 'is invalid without order_date' do
    @purchase.order_date = nil
    @purchase.valid?
    expect(@purchase.errors[:order_date]).to include("can't be blank")
  end
end

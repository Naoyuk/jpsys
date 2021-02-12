require 'rails_helper'

RSpec.describe Supplier, type: :model do
  
  it "is valid with a name, a representative, an email, and an address" do
    supplier = Supplier.new(
      name: "test supplier",
      representative: "test rep",
      email: "test@example.com",
      address: "1234 test address"
    )
    expect(supplier).to be_valid
  end

  it "is invalid without a name" do
    supplier = Supplier.new(name: nil)
    supplier.valid?
    expect(supplier.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a representative" do
    supplier = Supplier.new(representative: nil)
    supplier.valid?
    expect(supplier.errors[:representative]).to include("can't be blank")
  end

  it "is invalid without an email" do
    supplier = Supplier.new(email: nil)
    supplier.valid?
    expect(supplier.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicated email address" do
    Supplier.create(
      name: "test",
      representative: "test rep",
      email: "test@example.com"
    )
    supplier = Supplier.new(
      name: "test2",
      representative: "test rep",
      email: "test@example.com"
    )
    supplier.valid?
    expect(supplier.errors[:email]).to include("has already been taken")
  end

end

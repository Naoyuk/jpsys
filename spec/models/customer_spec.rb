require 'rails_helper'

RSpec.describe Customer, type: :model do

  it "is valid with a name, email, and address" do
    customer = Customer.new(
      name: "Naoyuki",
      email: "naoyuki@exmple.com",
      address: "1001 example street, Squamish, British Columbia V0N1T0",
    )
    expect(customer).to be_valid
  end

  it "is invalid without a name" do
    customer = Customer.new(name: nil)
    customer.valid?
    expect(customer.errors[:name]).to include("can't be blank")
  end

end

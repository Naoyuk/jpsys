# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  order_number   :integer          not null
#  customer_id    :integer          not null
#  gst            :float
#  pst            :float
#  total          :float
#  order_date     :date             not null
#  payment_date   :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Order < ApplicationRecord
  validates :order_number, presence: true
  validates :order_date, presence: true

  belongs_to :customer, optional: true
  has_many :lists, inverse_of: :order
  # has_many :lists, dependent: :destroy

  accepts_nested_attributes_for :lists, reject_if: :all_blank, allow_destroy: true

  def selectable_customers
    Customer.all.order(:id)
  end

  def self.total_sales
    orders = Order.all
    sum = 0
    orders.each do |order|
      sum += order.total
    end
    sum
  end

  def total
    lists.to_a.sum { |list| list.subtotal }
  end

  private

    def self.set_order_number
      if Order.last
        new_number = Order.last.order_number + 1
      else
        new_number =3001
      end
      new_number
    end
end

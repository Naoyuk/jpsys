# frozen_string_literal: true

class Order < ApplicationRecord
  validates :order_number, presence: true
  validates :order_date, presence: true

  belongs_to :customer, optional: true
  has_many :lists, dependent: :destroy

  def total
    lists.to_a.sum { |list| list.subtotal }
  end

  def self.total_sales
    orders = Order.all
    sum = 0
    orders.each do |order|
      sum += order.total
    end
    sum
  end
end

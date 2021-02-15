# frozen_string_literal: true

class Order < ApplicationRecord
  validates :order_number, presence: true
  validates :order_date, presence: true

  belongs_to :customer, optional: true
  has_many :lists, dependent: :destroy

  def self.total_order
    # sum(:total)
    orders = Order.all
    sum = 0
    orders.each do |order|
      order.lists.each do |list|
        sum += list.list_price * list.amount
      end
    end
    sum
  end

  def total
    sum = 0
    lists = Order.all.lists
    lists.each { |li| sum += li.list_price * li.amount }
    sum
  end
end

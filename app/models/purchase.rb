# frozen_string_literal: true

class Purchase < ApplicationRecord
  validates :item_name, presence: true
  validates :amount, presence: true
  validates :price, presence: true
  validates :payment_method, presence: true
  validates :order_date, presence: true

  belongs_to :supplier

  def self.total_purchase
    sum(:price)
  end
end

class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :lists, dependent: :destroy

  def self.total_order
    self.sum(:total)
  end

  def total
    sum = 0
    lists.each {|li| sum += li.list_price * li.amount}
    sum
  end
end

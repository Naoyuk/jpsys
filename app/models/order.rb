class Order < ApplicationRecord
  belongs_to :customer
  has_many :lists, dependent: :destroy

  def total
    sum = 0
    lists.each {|li| sum += li.list_price * li.amount}
    sum
  end
end

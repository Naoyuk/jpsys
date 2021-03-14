# frozen_string_literal: true

# == Schema Information
#
# Table name: lists
#
#  id             :integer          not null, primary key
#  order_id       :integer          not null
#  item_id        :integer          not null
#  amount         :integer          not null
#  list_price     :integer
#  discount       :integer          default: 0
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class List < ApplicationRecord
  validates :item_id, presence: true
  validate do |list|
    list.errors.add(:item_id, :blank, message: 'cannot be blank') if list.item_id.nil?
  end
  validates :amount, presence: true, numericality: { greater_than: 0 }

  belongs_to :order
  belongs_to :item

  def subtotal
    item.price * amount - discount
  end

  def selectable_items
    Item.all
  end
end

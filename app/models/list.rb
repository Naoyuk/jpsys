# frozen_string_literal: true

class List < ApplicationRecord
  validates :item_id, presence: true
  validate do |list|
    list.errors.add(:item_id, :blank, message: 'cannot be blank') if list.item_id.nil?
  end
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :list_price, presence: true, numericality: { greater_than: 0 }

  belongs_to :order
  belongs_to :item
end

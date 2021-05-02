# frozen_string_literal: true

# == Schema Information
#
# Table name: purchases
#
#  id             :integer          not null, primary key
#  supplier_id    :integer          not null
#  item_name      :string           not null
#  amount         :integer          not null
#  price          :float            not null
#  cad            :float
#  jpy            :integer
#  payment_method :string           not null
#  note           :text
#  order_date     :date             not null
#  payment_date   :date
#  exchangerate   :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Purchase < ApplicationRecord
  validates :order_date, presence: true

  belongs_to :supplier
  has_many :lines

  accepts_nested_attributes_for :lines, reject_if: :all_blank, allow_destroy: true

  def self.total_purchase
    sum(:price)
  end
end

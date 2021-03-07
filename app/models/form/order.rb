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

class Form::Order < Order
  REGISTRABLE_ATTRIBUTES = %i(order_number customer_id order_date payment_date get pst total)
  has_many :lists, class_name: 'Form::List'

  after_initialize { lists.build unless self.persisted? || lists.present? }
  before_validation :calculate_order_price

  def selectable_customers
    Customer.all
  end

  private

    def calculate_order_price
      lists.each(&:calculate_list_price)
      self.total = lists.map(&:list_price).sum
    end
end

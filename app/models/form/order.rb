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

class OrderForm < Order
  include ActiveModel::Model

  attr_accessor :order_number :customer_id :order_date :payment_date :gst :pst :total
  validates :order_number, presence: true
  validates :customer_id, presence: true

  # REGISTRABLE_ATTRIBUTES = %i(order_number customer_id order_date payment_date get pst total)
  # has_many :lists, class_name: 'Form::List'

  def initialize(attributes = nil, order: Order.new)
    @order = order
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      lists = split_tag_names.map { |name| List.find_or_create_by!(name: name) }
      order.update!(
        order_number: order_number, 
        customer_id: customer_id, 
        order_date: order_date, 
        payment_date: payment_date,
        gst: get,
        pst: pst,
        total: total)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def to_model
    order
  end

  after_initialize { lists.build unless self.persisted? || lists.present? }
  before_validation :calculate_order_price

  def selectable_customers
    Customer.all
  end

  def to_model
    order
  end

  private

    def calculate_order_price
      lists.each(&:calculate_list_price)
      self.total = lists.map(&:list_price).sum
    end

    attr_reader :order

    def default_attributes{
      order_number: order.order_number, 
      customer_id: order.customer_id, 
      order_date: order.order_date, 
      payment_date: order.payment_date,
      gst: order.get,
      pst: order.pst,
      total: order.total
      }
    end

end

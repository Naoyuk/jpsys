# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]

  def index
    @orders = Order.all.order(order_number: 'DESC')
    @total_sales = @orders.total_sales
    @total_purchase = Purchase.total_purchase
    @profit = BigDecimal(@total_sales.to_s) - BigDecimal(@total_purchase.to_s)
  end

  def show
    @order = Order.find(params[:id])
    @lists = List.where(order_id: @order.id)
    @total = @order.total
  end

  def new
    @order = Order.new
    @order.order_number = Order.set_order_number
    ActiveRecord::Base.connection.execute("SELECT setval('lists_id_seq', coalesce((SELECT MAX(id)+1 FROM lists), 1), false)")
    2.times { @order.lists.build }
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path, notice: 'The order has been created.'
    else
      render :new
    end
  end

  def edit
    @form = Order.new(order: @order)
  end

  def update
    @form = Order.new(order_params, order: @order)
    if @form.save
      redirect_to orders_path, notice: 'The order has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    else
      render :show
    end
  end

  def add_list
    @list = @order.lists.build
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params
        .require(:order)
        .permit(:order_number, :customer_id, :order_date, :payment_date, :gst, :pst, :total, lists_attributes: [:id, :order_id, :item_id, :amount, :list_price, :discount])
    end
end

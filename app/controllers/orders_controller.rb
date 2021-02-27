# frozen_string_literal: true

class OrdersController < ApplicationController
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
    if Order.last
      new_number = Order.last.order_number + 1
    else
      new_number =3001
    end
    @order.order_number = new_number
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render 'new'
    end
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.total = @order.total
    if @order.update(order_params)
      redirect_to orders_path
    else
      render 'edit'
    end
  end

  def destroy
    @order = Order.find(params[:id])
    if @order.destroy
      redirect_to orders_path
    else
      render 'show'
    end
  end

  def add_list
    @list = @order.lists.build
  end

  private

  def order_params
    params.require(:order).permit(:order_number, :customer_id, :order_date, :payment_date, :gst, :pst, :total)
  end
end

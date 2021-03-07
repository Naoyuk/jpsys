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
    @order = Form::Order.new
    @order.set_order_number
  end

  def create
    @order = Form::Order.new(order_params)

    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @order.total = @order.total
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end

  def destroy
    @order = Form::Order.find(params[:id])
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
      @order = Form::Order.find(params[:id])
    end

    def order_params
      params
        .require(:form_order)
        .permit(REGISTRABLE_ATTRIBUTES + 
                [lists_attributes: Form::List::REGISTRABLE_ATTRIBUTES]
              )
    end
end

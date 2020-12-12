class OrdersController < ApplicationController
  def index
    @orders = Order.all.order(order_number: "DESC")
    @total_order = @orders.sum(:total)
    @total_purchase = Purchase.all.sum(:price)
    @profit = @total_order - @total_purchase
  end

  def show
    @order = Order.find(params[:id])
    @lists = List.where(order_id: @order.id)
    @total = @order.total
  end

  def new
    @order = Order.new
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


  private
  def order_params
    params.require(:order).permit(:order_number, :customer_id, :order_date, :payment_date, :gst, :pst, :total)
  end
end

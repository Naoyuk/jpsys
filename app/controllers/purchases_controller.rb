# frozen_string_literal: true

class PurchasesController < ApplicationController
  before_action :exchange_rate, only: [:new, :edit]
  def index
    @purchases = Purchase.all.order(created_at: 'DESC')
    @total_sales = Order.total_sales
    @total_purchase = Purchase.total_purchase
    @profit = BigDecimal(@total_sales.to_s) - BigDecimal(@total_purchase.to_s)
  end

  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      redirect_to purchases_path
    else
      render 'new'
    end
  end

  def edit
    @purchase = Purchase.find(params[:id])
  end

  def update
    @purchase = Purchase.find(params[:id])
    if @purchase.update(purchase_params)
      redirect_to purchases_path
    else
      render 'edit'
    end
  end

  def destroy; end

  def exchange_rate
    exchange_rates = Exchange.last(2)
    rate = (exchange_rates[1].rate / exchange_rates[0].rate).round(2)
    timestamp = exchange_rates[1].created_at.strftime("%d/%b/%Y %I:%M %p")
    @exchange_rate = "#{rate} ( #{timestamp} )"
  end

  private

  def purchase_params
    params.require(:purchase).permit(:supplier_id, :item_name, :amount, :price, :cad, :jpy, :payment_method, :note,
                                     :order_date, :payment_date, :exchangerate)
  end
end

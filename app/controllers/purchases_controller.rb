class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all.order(created_at: "DESC")
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

  def destroy
  end

  private

  def purchase_params
    params.require(:purchase).permit(:supplier_id, :item_name, :amount, :price, :cad, :jpy, :payment_method, :note, :order_date, :payment_date, :exchangerate)
  end
end

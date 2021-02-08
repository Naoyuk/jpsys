# frozen_string_literal: true

class ListsController < ApplicationController
  def new
    @list = List.new(order_id: params[:order_id])
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to order_path(@list.order_id)
    else
      render new
    end
  end

  def update; end

  def edit; end

  def destroy; end

  private

  def list_params
    params.require(:list).permit(:order_id, :item_id, :amount, :list_price, :discount)
  end
end

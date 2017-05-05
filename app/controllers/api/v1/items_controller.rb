class Api::V1::ItemsController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = @order.items

    respond_with @items
  end

  def show
    respond_with @item
  end

  def create
    @item = @order.items.create(item_params)
    respond_with @item
  end

  def update
    @item.update(item_params)
    respond_with @item
  end

  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def set_order
    @order = Order.find(params[:order_id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :quantity, :price)
  end
end

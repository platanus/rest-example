class ItemsController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = @order.items

    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = @order.items.build(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
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

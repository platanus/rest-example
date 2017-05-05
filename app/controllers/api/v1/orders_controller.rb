class Api::V1::OrdersController < ApplicationController
  before_action :set_customer, only: [:index, :create]
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = @customer.orders
    respond_with @orders
  end

  def show
    respond_with @order
  end

  def create
    @order = @customer.orders.build(order_params)
    respond_with @order
  end

  def update
    @order.update(order_params)
    respond_with @order
  end

  def destroy
    @order.destroy
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customer
    @customer = Customer.find(params[:customer_id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end

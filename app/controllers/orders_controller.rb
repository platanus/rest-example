class OrdersController < ApplicationController
  before_action :set_customer, only: [:index, :create]
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = @customer.orders

    render json: @orders
  end

  def show
    render json: @order
  end

  def create
    @order = @customer.orders.build(order_params)

    if @order.save
      render json: @order, status: :created, location: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
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

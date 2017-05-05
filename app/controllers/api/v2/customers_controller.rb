class Api::V2::CustomersController < ApplicationController
  before_action :set_customer, only: [:show]

  def index
    @customers = paged(Customer.all)
    respond_with @customers, each_serializer: ::V2::CustomerSerializer
  end

  def show
    respond_with @customer, serializer: ::V2::CustomerSerializer
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end

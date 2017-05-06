class Api::V2::CustomersController < Api::V2::BaseController
  before_action :set_customer, only: [:show]

  def index
    @customers = paged(Customer.all)
    respond_with @customers
  end

  def show
    respond_with @customer
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end

class Api::V1::CustomersController < Api::V1::BaseController
  before_action :set_customer, only: [:show, :update, :destroy]
  deprecate :create, :update, :destroy

  def index
    @customers = paged(Customer.all)
    respond_with @customers
  end

  def show
    respond_with @customer
  end

  def create
    @customer = Customer.create(customer_params)
    respond_with @customer
  end

  def update
    @customer.update(customer_params)
    respond_with @customer
  end

  def destroy
    @customer.destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:name, :email)
  end
end

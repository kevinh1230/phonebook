class OrdersController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.create(order_params)
    redirect_to customer_path(@customer)
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    @order = @customer.orders.find(params[:id])
    @order.destroy
    redirect_to customer_path(@customer)
  end

  private
  def order_params
    params.require(:order).permit(:order)
  end
end
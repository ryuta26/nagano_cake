class Admin::OrdersController < ApplicationController
  def show
  	@order = Order.find(params[:id])
  	@end_user = EndUser.with_deleted.find(@order.end_user_id)
  	@total_price = @order.order_details.sum{|ci| ci.item.price * ci.amount}
  end

  def index
  	@orders = Order.where(confirm_status: "注文確定済み")
  	@order_details = OrderDetail.all

  end

  def update
  	@order = Order.find(params[:id])
	@order.update_attribute(:order_stauts, params[:order][:order_stauts])
    redirect_to admin_order_path(@order)
  end

private
	def order_params
		params.require(:order).permit(:end_user_id, :postal_code, :domicile, :name, :payment_method, :freight_fee, :total_due, :order_stauts, :address_status, :confirm_status)
	end

end

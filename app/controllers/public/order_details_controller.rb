class Public::OrderDetailsController < ApplicationController
	def create
  	@order_detail = OrderDetail.new(order_detail_params)
  	@order_detail.save
  	
	redirect_to public_end_user_order_thanks_path(current_end_user, @order_detail.order_id)
  end
  private
	  def order_detail_params
			params.require(:order_detail).permit(:item_id, :order_id, :amount, :purchase_price, :production_status)
	  end
end

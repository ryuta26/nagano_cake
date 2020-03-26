class Public::OrdersController < ApplicationController

	def new
		@order = Order.new
		@end_user = current_end_user
	end

	def confirm
		@cart_items = current_end_user.cart_items
		@order = Order.find(params[:id])
		@total_price = @cart_items.sum{|ci| ci.item.price * ci.amount}
		@order.attributes = {total_due: (@total_price * 1.1).round + (@order.freight_fee)}
		@order.save
		@cart_items.each do |cart_item|
			@order_detail = OrderDetail.new(item_id: cart_item.item_id, order_id: @order.id, amount: cart_item.amount, purchase_price: cart_item.item.price, productin_status: "着手不可")
			@order_detail.save
		end
	end

	def thanks
		@order = Order.find(params[:id])
		@order.confirm_status = "注文確定済み"
		@order.save

	end

	def create
		@order = Order.new(order_params)
		@order.end_user_id = current_end_user.id
		if params[:order][:address_status] == "ご自身の住所"
			@order.postal_code = current_end_user.postal_code
			@order.domicile = current_end_user.domicile
			@order.name = current_end_user.fullname
		elsif params[:order][:address_status] == "登録済住所から選択"
			@address = Address.find_by(params[:addres])
			@order.postal_code = @address.postal_code
			@order.domicile = @address.domicile
			@order.name = @address.name
		else
		end
		@order.save
		redirect_to public_end_user_order_confirm_path(current_end_user, @order)
	end

	def update
		@order = Order.find(params[:id])
		@order.confirm_status = "注文確定済み"
		@order.save

		redirect_to public_end_user_order_thanks_path(current_end_user, @order)
	end

	private
	def order_params
		params.require(:order).permit(:end_user_id, :postal_code, :domicile, :name, :payment_method, :freight_fee, :total_due, :order_stauts, :address_status, :confirm_status)
	end
	
end

class Public::CartItemsController < ApplicationController
	def index
		@cart_items = current_end_user.cart_items
		@total_price = @cart_items.sum{|ci| ci.item.price * ci.amount}
	end
	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.save
		redirect_to public_end_user_cart_items_path(current_end_user)
	end
	def destroy
	  	@cart_item = CartItem.find(params[:id])
	  	@cart_item.destroy
	  	redirect_to public_end_user_cart_items_path(current_end_user)
  	end

  	def destroy_all
  		@cart_items = current_end_user.cart_items
  		@cart_items.destroy_all
  		redirect_to public_items_path
  	end

  	def update
  		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
  		redirect_to public_end_user_cart_items_path(current_end_user)
  	end

	private

	def cart_item_params
		params.require(:cart_item).permit(:amount, :end_user_id, :item_id)
	end

end

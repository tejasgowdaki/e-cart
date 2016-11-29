class CartLineItemsController < ApplicationController

	before_action :authenticate_user!

	def index
		@cart_line_items = CartLineItem.where('user_profile_id = ?', current_user.user_profile.id)
	end

	def create
		@cart_line_item = CartLineItem.new(cart_line_item_param)
		@cart_line_item.user_profile_id = current_user.user_profile.id
		if @cart_line_item.save
			redirect_to cart_line_items_path
		else
			redirect_to product_path(@cart_line_item.product_id)
		end
	end

	def update
		@cart_line_item = CartLineItem.find(params[:id])
		if @cart_line_item.update_attributes(cart_line_item_param)
			redirect_to cart_line_items_path
		else
			render action: "edit"
		end
	end

	def destroy
		@cart_line_item = CartLineItem.find(params[:id])
		@cart_line_item.destroy
		redirect_to cart_line_items_path
	end

	private

	def cart_line_item_param
		params[:cart_line_item].permit(:price, :quantity, :product_id)
	end

end

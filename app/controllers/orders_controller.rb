class OrdersController < ApplicationController

	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_param)
		@order.order_number = "#{current_user.id}--#{Random.rand(100..200)}"
		@order.order_date = Date.today
		@order.order_status = "Confirmed"
		if @order.save
			redirect_to order_path(@order.id)
		else
			render action: "new"
		end
	end

	private

	def order_param
		params[:order].permit(:order_number, :total, :address_id, :user_profile_id, :payment_mode)
	end

end

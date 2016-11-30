class Order < ActiveRecord::Base

	belongs_to :user_profile
	belongs_to :address
	has_many :order_line_items

	validates_presence_of :address_id, :payment_mode

	after_create :push_to_order_line_items

	def push_to_order_line_items
		cart_line_items = self.user_profile.cart_line_items
		cart_line_items.each do |cart_line_item|
			order_line_item = OrderLineItem.new
			order_line_item.price = cart_line_item.price
			order_line_item.quantity = cart_line_item.quantity
			order_line_item.order_id = self.id
			order_line_item.product_id = cart_line_item.product_id
			order_line_item.user_profile_id = cart_line_item.user_profile_id
			order_line_item.save
		end
		self.user_profile.cart_line_items.delete_all
	end

end

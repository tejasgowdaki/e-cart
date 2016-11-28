class CartLineItem < ActiveRecord::Base

	belongs_to :product
	belongs_to :user_profile

	validates_presence_of :user_profile_id, :product_id, :price, :quantity

end

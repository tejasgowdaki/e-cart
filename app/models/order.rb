class Order < ActiveRecord::Base

	belongs_to :user_profile
	belongs_to :address

	validates_presence_of :order_number, :order_date, :total, :payment_mode, :user_profile_id, :address_id, :order_status

end

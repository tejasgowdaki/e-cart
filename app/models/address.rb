class Address < ActiveRecord::Base

	belongs_to :user_profile
	has_many :orders

	validates_presence_of :title, :address, :landmark

end

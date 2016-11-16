class Address < ActiveRecord::Base

	belongs_to :user_profile

	validates_presence_of :title, :address, :landmark

end

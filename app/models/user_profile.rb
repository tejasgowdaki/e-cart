class UserProfile < ActiveRecord::Base

	belongs_to :user
	has_many :addresses
	has_many :reviews
	has_many :cart_line_items

	validates_presence_of :name, :date_of_birth, :mobile
	validates_numericality_of :mobile
	validates_length_of :mobile, is: 10

end

class Review < ActiveRecord::Base

	belongs_to :user_profile
	belongs_to :product

	validates_presence_of :title, :rating, :body
	validates_numericality_of :rating, less_than_or_equal_to: 5, greater_than: 0

end

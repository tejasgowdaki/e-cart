class Category < ActiveRecord::Base

	has_many :brand_categories
	has_many :brands, through: :brand_categories
	has_many :sub_categories
	has_many :sizes
	has_many :products
	
	validates_presence_of :name

end

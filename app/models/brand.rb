class Brand < ActiveRecord::Base

	has_many :brand_categories
	has_many :categories, through: :brand_categories
	has_many :products
	
	validates_presence_of :name

end

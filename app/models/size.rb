class Size < ActiveRecord::Base

	belongs_to :category
	has_many :product_sizes
	has_many :products, through: :product_sizes

	validates_presence_of :name, :category_id

end

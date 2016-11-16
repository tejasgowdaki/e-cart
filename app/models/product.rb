class Product < ActiveRecord::Base

	belongs_to :category
	belongs_to :sub_category
	belongs_to :brand
	has_many :product_sizes
	has_many :sizes, through: :product_sizes
	has_many :reviews

	validates_presence_of :name, :price, :description, :stock, :availability_date, :size_ids
	validates_presence_of :category_id, :sub_category_id, :brand_id
	validates_numericality_of :price, greater_than_or_equal_to: 0
	validates_numericality_of :stock, greater_than: 0

end

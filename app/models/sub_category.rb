class SubCategory < ActiveRecord::Base

	belongs_to :category
	has_many :products

	validates_presence_of :name, :category_id

end

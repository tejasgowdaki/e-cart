class BrandCategory < ActiveRecord::Base

	belongs_to :brands
	belongs_to :categories

end

task :clear_data => :environment do 
	Role.delete_all
	User.delete_all
	Permission.delete_all
	Category.delete_all
	SubCategory.delete_all
	Brand.delete_all
	BrandCategory.delete_all
	Size.delete_all
	UserProfile.delete_all
	Product.delete_all
	Address.delete_all
	ProductSize.delete_all
	Review.delete_all
	CartLineItem.delete_all
	Order.delete_all
	OrderLineItem.delete_all
end
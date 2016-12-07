task :setup_data => :environment do

	# Creating roles
	Role.create(name: "admin")
	Role.create(name: "user")
	
	# Creating users and assign roles
	user = User.create(email: "admin@gmail.com", username: "Admin", password: "9900176115")
	user.roles.push(Role.first) #assign admin role
	user.roles.push(Role.last) #assign user role

	user = User.create(email: "tejas@gmail.com", username: "Tejas", password: "9900176115")
	user.roles.push(Role.last) #assign user role

	# Create categories
	10.times do
		Category.create(name: Faker::Commerce.department(2, true))
	end

	# Create subcategories
	20.times do
		SubCategory.create(name: Faker::Commerce.department(1, true), category_id: Category.all.pluck(:id).sample)
	end

	# Create brands
	10.times do 
		Brand.create(name: Faker::GameOfThrones.house)
	end

	# Create brang_categories
	20.times do
		BrandCategory.create(category_id: Category.all.pluck(:id).sample, brand_id: Brand.all.pluck(:id).sample)
	end

	# Create sizes
	50.times do
		Size.create(name: ["s","m","l","xl","xxl"].sample, category_id: Category.all.pluck(:id).sample)
	end

	# Create user_profile
	UserProfile.create(name: "Admin", date_of_birth: "1996-08-13", mobile: "9945904839", user_id: User.first.id)
	UserProfile.create(name: "Tejas", date_of_birth: "1993-07-27", mobile: "9900176115", user_id: User.second.id)

	# Create products
	100.times do
		product = Product.new
		product.name = Faker::Commerce.product_name
		product.price = Faker::Number.between(500, 5000)
		product.description = Faker::Lorem.paragraph
		product.stock = Faker::Number.between(0, 100)
		product.availability_date = Faker::Date.between(Date.today - 1.week, 1.week.from_now)
		category = Category.order("RANDOM()").first 
		product.category_id = category.id 
		product.sub_category_id = category.sub_categories.pluck(:id).sample
		product.brand_id = category.brands.pluck(:id).sample
		3.times do
			product.sizes.push(category.sizes.sample)
		end
		product.save
	end 

	# Create address
	5.times do
		Address.create(title: Faker::Name.first_name, address: Faker::Address.secondary_address + ", " + Faker::Address.street_address + ", " + Faker::Address.street_name + ", " + Faker::Address.city, landmark: Faker::Address.state, user_id: User.all.pluck(:id).sample)
	end

	# Create product sizes
	100.times do 
		p_size = ProductSize.new
		product = Product.order("RANDOM()").first
		p_size.product_id = product.id
		p_size.size_id = product.category.sizes.sample
		p_size.save
	end

	# Create reviews
	100.times do
		Review.create(title: Faker::Lorem.sentence, rating: [1,2,3,4,5].sample, body: Faker::Lorem.paragraph, user_id: User.all.pluck(:id).sample, product_id: Product.all.pluck(:id).sample)
	end

end
class ProductsController < ApplicationController

	def index
		@products = Product.all
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(product_param)
		if @product.save
			redirect_to products_path
		else
			render	action: "new"
		end
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update_attributes(product_param)
			redirect_to products_path, notice: "Successfully updated"
		else
			render	action: "edit"
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_path, notice: "Successfully deleted"
	end	


	private

	def product_param
		params[:product].permit(:name, :price, :description, :stock, :availability_date, :category_id, :sub_category_id, :brand_id)
	end

end
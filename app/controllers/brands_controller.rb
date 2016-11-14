class BrandsController < ApplicationController

	def index
		@brands = Brand.all
	end

	def new
		@brand = Brand.new
	end

	def create
		@brand = Brand.new(brand_param)
		if @brand.save
			redirect_to brands_path
		else
			render	action: "new"
		end
	end

	def show
		@brand = Brand.find(params[:id])
	end

	def edit
		@brand = Brand.find(params[:id])
	end

	def update
		@brand = Brand.find(params[:id])
		if @brand.update_attributes(brand_param)
			redirect_to brand_path(@brand.id), notice: "Successfully updated"
		else
			render	action: "edit"
		end
	end

	def destroy
		@brand = Brand.find(params[:id])
		@brand.destroy
		redirect_to brands_path, notice: "Successfully deleted"
	end	


	private

	def brand_param
		params[:brand].permit(:name, category_ids: [])
	end

end

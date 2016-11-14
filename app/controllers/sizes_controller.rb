class SizesController < ApplicationController

	def index
		@sizes = Size.all
	end

	def new
		@size = Size.new
	end

	def create
		@size = Size.new(size_param)
		if @size.save
			redirect_to sizes_path
		else
			render action: "new"
		end
	end

	def edit
		@size = Size.find(params[:id])
	end

	def update
		@size = Size.find(params[:id])
		if @size.update_attributes(size_param)
			redirect_to sizes_path
		else
			render action: "edit"
		end
	end

	def destroy
		@size = Size.find(params[:id])
		@size.destroy
		redirect_to sizes_path
	end

	private

	def size_param
		params[:size].permit(:name, :category_id)
	end

end

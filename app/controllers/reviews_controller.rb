class ReviewsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index, :show]
	load_and_authorize_resource except: [:create]

	def create
		@review = Review.new(review_param)
		if @review.save
			redirect_to product_path(@review.product_id)
		else
			redirect_to product_path(@review.product_id)
		end
	end

	def update
		@review = Review.find(params[:id])
		if @review.update_attributes(review_param)
			redirect_to product_path(@review.product_id)
		else
			render action: "edit"
		end
	end

	def destroy
		@review = Review.find(params[:id])
		@review.destroy
		redirect_to product_path(@review.product_id)
	end

	private

	def review_param
		params[:review].permit(:title, :body, :rating, :product_id, :user_profile_id)
	end

end

class AddressesController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource except: [:create]

	def index
		@addresses = Address.all
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_param)
		@address.user_profile_id = User.find(current_user.id).user_profile.id
		if @address.save
			redirect_to user_profile_path(@address.user_profile_id)
		else
			render action: "new"
		end
	end

	def edit
		@address = Address.find(params[:id])
	end

	def update
		@address = Address.find(params[:id])
		if @address.update_attributes(address_param)
			redirect_to user_profile_path(@address.user_profile_id)
		else
			render action: "edit"
		end
	end

	def destroy
		@address = Address.find(params[:id])
		@address.destroy
		redirect_to user_profile_path(current_user.user_profile.id)
	end

	private

	def address_param
		params[:address].permit(:title, :address, :landmark)
	end

end

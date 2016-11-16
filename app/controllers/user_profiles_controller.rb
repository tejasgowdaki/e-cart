class UserProfilesController < ApplicationController

	def index
		@user_profiles = UserProfile.all
	end

	def new
		@user_profile = UserProfile.new
	end

	def create
		@user_profile = UserProfile.new(user_profile_param)
		@user_profile.user_id = current_user.id
		if @user_profile.save
			redirect_to user_profiles_path
		else
			render action: "new"
		end
	end

	def show
		@user_profile = UserProfile.find(params[:id])
	end

	def edit
		@user_profile = UserProfile.find(params[:id])
	end

	def update
		@user_profile = UserProfile.find(params[:id])
		if @user_profile.update_attributes(user_profile_param)
			redirect_to user_profile_path(@user_profile.id)
		else
			render action: "edit"
		end
	end

	def destroy
		@user_profile = UserProfile.find(params[:id])
		@user_profile.destroy
		redirect_to categories_path
	end

	private

	def user_profile_param
		params[:user_profile].permit(:name, :mobile, :date_of_birth)
	end

end

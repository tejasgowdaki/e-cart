class RegistrationsController < Devise::RegistrationsController

	def after_sign_in_path_for(resource)
        if resource.sign_in_count == 1
           new_user_profile_path
        else
           root_path
        end
    end

	private

	def sign_up_params
		params[:user].permit(:email, :username, :password, :password_confirmation)
	end


end
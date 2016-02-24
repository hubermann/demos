class UsersController < ApplicationController
	skip_before_filter :verify_authenticity_token

	protect_from_forgery with: :null_session

	def index
		@users = User.all 
		render status:200, json: {
				message: "Users inside",
				user: @users
			}.to_json
	end

	def create
		Rails.logger.debug params.inspect
    @user = User.new(user_params) ## Invoke user_params method
    if @user.save
      #redirect_to @user, notice: 'User was successfully created.' 
      render status:200, json: {
				message: "User created",
				user: @user
			}.to_json
    else
      render status:422, json: {
				errors: @user.errors
				}.to_json
    end       
  end



	private 
		def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end

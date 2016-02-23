class UsersController < ApplicationController


	def create
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
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end

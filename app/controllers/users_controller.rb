class UsersController < ApplicationController


	def create
    @user = User.new(user_params) ## Invoke user_params method
    if @user.save
      redirect_to @user, notice: 'User was successfully created.' 
    else
      render action: 'new'
    end       
  end


  
	private 
	def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end

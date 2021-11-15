class UsersController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def sign_up
    @user = User.new
  end

  def account_verify
    clean_params = params.require(:user).permit(:username, :password, :email)
    
    @user = User.new(clean_params)

    if @user.save
      redirect_to "/"
    else
      render :sign_up
    end

  end

end
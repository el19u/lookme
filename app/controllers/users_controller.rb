class UsersController < ApplicationController
  def sign_up
    @user = user.new
  end

  def account_verify
    @user = user.new(clean_params)

    if @user.save
      redirect_to "/"
    elsif
      render :sign_up
    end

    private
    def clean_params
      params.require(:user).permit(:username, :password, :email)
    end
  end

end
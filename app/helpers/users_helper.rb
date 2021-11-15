module UsersHelper
  def user_signed_in?
    session[:login].present?
  end
end
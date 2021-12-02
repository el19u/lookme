class Api::V1::CoursesController < ApplicationController
  # skip_before_action :verify_authenticity_token
  before_action :check_login

  def like
    course = Course.find(params[:id])

    favorited_course = FavorCourse.find_by(user: current_user, course: course)
   
    if favorited_course
      favorited_course.destroy
      render json: { status: 'unlike' }
    else
      current_user.favorite_courses << course
      render json: { status: 'like' }
    end

  end

  private 

  def check_login
    if !user_signed_in?
      render json: { status: "fail", message: "need to login" }, status: 401
      return
    end
  end

end

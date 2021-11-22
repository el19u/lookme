class CoursesController < ApplicationController
  before_action :find_course, only: [:edit, :update, :destroy]
  before_action :require_login?, except: [:index, :show]


  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "Success"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "Success"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy if @course
    redirect_to courses_path, notice: "Success"
  end

  private
  def find_course
    @course = current_user.courses.find(params[:id])
  end

  def require_login?
    redirect_to sign_in_path, notice: '請先登入會員' unless user_signed_in?
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end

end

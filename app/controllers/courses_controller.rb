class CoursesController < ApplicationController
  before_action :find_course, only: [:edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)

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
    @course = Course.find_by(id: params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end

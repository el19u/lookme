class CoursesController < ApplicationController
  before_action :find_course, only: [:edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]


  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @review = Review.new
    @reviews = Review.where(course_id: @course.id)
    # @reviews = @course.reviews.order(id: :desc)
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

  def buy
    @course = Course.find(params[:id])
    @order = Order.new

    # gateway = Braintree::Gateway.new(
    #   environment: :sandbox,
    #   merchant_id: ENV["braintree_merchant_id"]
    #   public_key: ENV["braintree_public_key"],
    #   private_key: ENV["braintree_private_key"],
    # ) 
    # @token = gateway.client_token.generate
  end

  private
  def find_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end

end

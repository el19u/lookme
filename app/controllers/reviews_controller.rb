class ReviewsController < ApplicationController
  before_action :authenticate!

  def create
    course = Course.find(params[:course_id])
    review = course.reviews.build(review_params)
    review.user = current_user
    if review.save
      redirect_to course_path(course), notice: "Review Success!"
    end

  end

  private
  def review_params
    params.require(:review).permit(:rating, :title, :content)
  end
end

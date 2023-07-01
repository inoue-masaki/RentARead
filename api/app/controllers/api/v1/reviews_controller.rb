class Api::V1::ReviewsController < ApplicationController
# before_action :authenticate_user

  def book_reviews
    @reviews = Review.where(book_id: params[:id])
    return_param = Review.add_user_name(@reviews)
    render json: return_param
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review.as_json
    else
      render json: review.errors,status: 422
    end
  end

  private

    def review_params
      params.require(:review).permit(
        :star,
        :title,
        :desc,
        :user_id,
        :book_id
      )
    end
end


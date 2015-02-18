class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    if user_has_reviewed(@restaurant)
      flash[:notice] = 'You can only review a restaurant once'
      redirect_to retaurants_path
    else
      @review = Review.new
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    @review.user_id = current_user.id
    if @review.save

      redirect_to restaurants_path
    else
      render 'new'
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end

module ReviewsHelper

  def user_has_reviewed(restaurant)
    any_reviews(restaurant) && user_reviewed(restaurant)
  end

  def any_reviews(restaurant)
    all_reviews_for(restaurant).any?
  end

  def all_reviews_for(restaurant)
    reviews.all.select { |review| review.restaurant_id == restaurant.id}
  end

  def user_reviewed(restaurant)
    all_reviews_for(restaurant).select { |review| review.user_id == current_user.id }.count > 0
  end

end

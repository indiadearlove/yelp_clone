module ReviewsHelper

  def star_rating(rating)
    return rating unless rating.respond_to?(:round)
    remainder = (5- rating)
    '★' * rating.round + "☆" * remainder
  end

  def time_since(review)
    puts Time.now
    puts review.created_at
    return "#{time_since_post_minutes} minues ago"
  end

end

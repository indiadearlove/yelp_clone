module ReviewsHelper

  def star_rating(rating)
    return rating unless rating.respond_to?(:round)
    remainder = (5- rating)
    '★' * rating.round + "☆" * remainder
  end

  def time_since(review)
    time_since_post_seconds = ((Time.now - review.created_at))
    case time_since_post_seconds
      when 0..(60 * 60)
        return "#{(time_since_post_seconds/60).to_i} minutes ago"
      when ((60 * 60)+1)..(60 * 60 * 24)
        return "#{(time_since_post_seconds/60/60).to_i} hours ago"
      when ((60 * 60 * 24)+1)..( 60 * 60 * 24 * 7)
        return "#{(time_since_post_seconds/60/60/24).to_i} days ago"
      else
        return review.created_at.strftime("%-d-%-m-%Y")
    end

  end

end

module RatingsHelper
  def rating(user, value, movie)
    user_rating_id = movie.ratings.where(user: user).take || ''
    star_id = "movie_#{movie.id}_#{value}"

    if user_rating.blank?
      user_rating_id = ''
    else
      user_rating_id = user_rating.id
    end

    if user_rating.blank? || value > user_rating.stars
      star_class = "fa fa-star-o star"
    else
      star_class = "fa fa-star star"
    end

    content_tag(:a, "",
      class: star_class,
      id: star_id,
      value: value,
      data: {
        movie_id: movie.id,
        user_rating_id: user_rating_id
        }
      )
  end
end

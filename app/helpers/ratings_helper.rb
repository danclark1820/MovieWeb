module RatingsHelper
  def rating(user, value, movie)
    user_rating_id = movie.ratings.where(user: user).take.id || ''
    star_id = "movie_#{movie.id}_#{value}"

    content_tag(:a, "",
      class: 'fa fa-star-o star',
      id: star_id,
      value: value,
      data: {
        movie_id: movie.id,
        user_rating_id: user_rating_id
        }
      )
  end
end

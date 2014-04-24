class RecommendationsWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    recommended_movies = Recommendation.get_recommendations(user)
    recommended_movies.each do |movie_id, score|
      if Movie.exists?(id: movie_id)
        recommendation = user.recommendations.find_by(movie_id: movie_id)
        recommendation ||= user.recommendations.build(movie_id: movie_id)
        recommendation.score = score
        recommendation.save!
      end
    end
  end

end

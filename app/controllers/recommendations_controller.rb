class RecommendationsController < ApplicationController
  def show
    @user = current_user
    new_ranks = get_recommendation(@user)
    @recs = []
    new_ranks.each do |movie, scored|
      recs << Recommendation.new(user_id: @user.id, movie_id: movie, score: scored)
    end

  end

  def create
    @user = current_user
    Recommendation.new.get_recommendation(@user)
    new_ranks.each do |movie, scored|
      Recommendation.new(user_id: @user.id, movie_id: movie, score: scored)
    end
  end

end

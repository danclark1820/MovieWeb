class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
        if current_user.ratings.count > 10
          RecommendationsWorker.every(10.minutes, current_user.id)
        end
        format.json {render json: @rating, status: :created }
      else
        puts "Error!"
      end
    end
  end

  def update
    @rating = Rating.find_by(user: current_user, movie_id: rating_params[:rating_id])
    respond_to do |format|
      if @rating.update(rating_params)
        if current_user.ratings.count > 10
          RecommendationsWorker.every(45.minutes, current_user.id)
        end
        format.json { render json: @rating, status: :created}
      else
        puts "Error!"
      end
    end
  end

  private
  def rating_params
    params.require(:rating).permit(:movie_id, :stars).merge(user: current_user)
  end
end

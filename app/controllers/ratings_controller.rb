class RatingsController < ApplicationController
  def create
    @rating = Rating.new(rating_params)
    respond_to do |format|
      if @rating.save
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

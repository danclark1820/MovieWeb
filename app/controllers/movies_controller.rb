class MoviesController < ApplicationController
  def show
  end

  def index
    @movies = Movie.all
    @ratings = Rating.where(user: current_user)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      flash[:notice] = "Successfully added #{@movie.title}"
      redirect_to movies_path
    else
      flash[:notice] = "Please fill in required fields"
      render new_movie_path(@movie)
    end
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :url)
  end

end

class MoviesController < ApplicationController
  def show
    flash[:notice] = 'Welcome to Movie Web'
  end

  def index
    flash[:notice] = 'Welcome to Movie Web'
  end
end

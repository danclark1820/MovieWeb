class RecommendationsController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.find(params[:id])
    @recommendation.new
  end
end

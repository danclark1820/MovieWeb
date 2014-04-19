class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recs = @user.getRecommendation(@user)
  end
end

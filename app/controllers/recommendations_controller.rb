class RecommendationsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @recommendations = current_user.recommendations.sort_by{|obj| obj.score}.reverse
  end

end

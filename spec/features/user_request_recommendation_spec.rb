require 'spec_helper'

feature 'user_request_recommendation', %q{
  As a user who rated movies
  I want to be able to get recommendation
  so that I can pick a movie to watch
} do

  context 'with ratings' do
    it 'returns movie recommendations' do
      user = FactoryGirl.create(:user)
      ratings = ratings
    end
  end

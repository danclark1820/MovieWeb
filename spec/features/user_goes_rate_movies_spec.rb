require 'spec_helper'

feature "authenticated user rates movies", %q{
    As a user
    I want to rate movies
    so that I can contribute to the movie web
  } do

    #Acceptance Criteria
    # * I must be able to view movies
    # * Pages will have no more then 7 movies on them
    # * I can rate movies 1 - 5

    context 'authenticated user' do
      it 'goes to rate movies' do
        user = FactoryGirl.create(:user)
        sign_in_as(user)
        click_button "Rate movies"
        expect(page).to have_content("You need to rate more movies")
      end
    end
  end

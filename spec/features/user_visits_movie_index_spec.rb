require 'spec_helper'

feature "authenticated user goes to rates movies", %q{
    As a user
    I want to go to the rate movies page
    so that I can contribute to the movie web
  } do

    #Acceptance Criteria
    # * I must be able to view get to the new ratings page

    context 'authenticated user' do
      it 'goes to rate movies' do
        user = FactoryGirl.create(:user)
        sign_in_as(user)
        expect(page).to have_content("Movie Index")
      end
    end
  end

require 'spec_helper'

feature " Un_authenticated user tries to rate movies", %q{
  As an un-authenticated User
  I want to be redirected to the sign in page
  so I can sign in
} do

  #Acceptance Criteria
  # * un-authenticated user can click on rate movies
  # * will be redirected to sign in page

  describe "enters site" do
    it "rate list of movies" do
      visit "/movies#index"
      click_on 'Rate movies'
      expect(page).to have_content("Sign in")
    end
  end
end

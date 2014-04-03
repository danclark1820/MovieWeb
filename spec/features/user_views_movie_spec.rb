require 'spec_helper'

feature "User views movies", %q{
  As a User
  I want to see all the movies that have been rated
  So that I can see the pool of movies
} do

  #Acceptance Criteria
  # * All the movies in the movies db must be listed
  # * It will display Title, Year, Genres

  describe "user enters site" do
    it "views the list of movies" do
      visit "/movies/index"

      expect(page).to have_content "Welcome to Movie Web"
    end
  end
end

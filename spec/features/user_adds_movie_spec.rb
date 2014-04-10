require 'spec_helper'

feature 'authenticated user adds movie', %q{
  As a user
  I want to add movies
  so that they can be rated by others
} do

  #Acceptance Criteria
  #* It requires a title
  #* It requires a year
  #* It requires an imdb url

  context 'with valid atttributes' do
    it 'adds a movie' do
      user = FactoryGirl.create(:user)
      movie = FactoryGirl.create(:movie)
      sign_in_as(user)

      visit new_movie_path
      fill_in 'Title',    with: movie.title
      fill_in 'Year',     with: movie.year
      fill_in 'IMDb URL', with: movie.url
      click_on "Add Movie"

      within('ul.movies'){expect(movie.title)}
    end
  end

  context 'with invalid attributes' do
    it 'prompts for valid input' do
      user = FactoryGirl.create(:user)
      sign_in_as(user)
      visit new_movie_path
      fill_in 'Title',    with: "Forrest Gump"
      fill_in 'Year',     with: "not a year"
      fill_in 'IMDb URL', with: "www.imdb.com"
      click_on "Add Movie"

      within('span.error'){expect('is invalid')}
    end
  end

end


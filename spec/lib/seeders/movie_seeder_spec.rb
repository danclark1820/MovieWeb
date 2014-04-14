require 'spec_helper'

describe Seeders::MovieSeeder do

  let(:seeder){ Seeders.MovieSeeder }

  it 'should seed the data' do
    one_movie = seeder.movie.first
    seeder.seed
    expect(Movie.where(title: one_movie[:title])).to be_present
  end
end

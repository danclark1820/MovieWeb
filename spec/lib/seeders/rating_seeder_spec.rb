require 'spec_helper'

describe Seeders::RatingSeeder do

  let(:seeder){ Seeders::RatingSeeder }

  it 'should seed the data' do
    one_rating = seeder.ratings.first
    seeder.seed
    expect(Rating.where(value: one_movie[:rating])).to be_present
  end
end

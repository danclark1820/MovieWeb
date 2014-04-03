require 'spec_helper'

describe Movie do
  it 'has valid attributes' do
    movie = FactoryGirl.create(:movie)
    expect(movie).to be_valid
  end
end

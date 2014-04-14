require 'spec_helper'

describe Rating do
  it {should have_valid(:user_id).when(3)}
  it {should have_valid(:movie_id).when(5)}
  it {should belong_to(:user)}
  it {should belong_to(:movie)}
end



require 'spec_helper'

describe Movie do
  it { should have_valid(:title).when("Green Mile") }
  it { should_not have_valid(:title).when(nil, '') }

  it { should have_valid(:year).when("1996") }
  it { should_not have_valid(:year).when("96")}
  it { should_not have_valid(:year).when(nil, "")}

  it { should have_valid(:url).when("http://www.imdb.com/title/tt1840309/")}
  it { should_not have_valid(:url).when("www.google.com")}
  it { should_not have_valid(:url).when(nil,"")}
end

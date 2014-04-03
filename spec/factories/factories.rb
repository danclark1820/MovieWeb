FactoryGirl.define do
  factory :movie do
    title "Forrest Gump"
    year "1996"
    url "www.imdb.com/awesome_movie"
    unknown false
    action false
    adventure false
    animation false
    childrens false
    comedy false
    crime false
    documentary false
    drama false
    fantasy false
    filmnoir false
    horror false
    musical false
    mystery false
    romance false
    scifi false
    thriller false
    war true
    western true
  end

  factory :user do
    email "user@example.com"
    password "password"
  end

end

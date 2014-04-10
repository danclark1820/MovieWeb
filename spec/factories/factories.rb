FactoryGirl.define do
  factory :movie do
    title "Forrest Gump"
    year "1996"
    sequence(:url){"www.imdb.com/factory/#{n}"}
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

  factory :rating do
    user_id 1
    movie_id 1
    stars 1
  end

end

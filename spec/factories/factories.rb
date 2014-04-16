FactoryGirl.define do
  factory :movie do
    title "Forrest Gump"
    year "1996"
    sequence(:url){|n| "www.imdb.com/#{n}"}
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
    sequence(:email) {|n| "user#{n}@example.com" }
    password "password"
  end

  factory :rating do
    stars 1

    user
    movie
  end

end

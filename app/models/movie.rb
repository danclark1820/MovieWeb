class Movie < ActiveRecord::Base
  validates :title, presence:true
  validates :year,  presence:true, format: {with: /\A\d{4}\z/, on: :create}
  validates :url,   presence:true, format: {with: /www.imdb.com/, on: :create}
end

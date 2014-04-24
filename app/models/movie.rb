class Movie < ActiveRecord::Base
  validates :title, presence:true
  validates :year,  presence:true, format: {with: /\A\d{4}\z/, on: :create}
  validates :url,   presence:true, format: {with: /imdb.com/, on: :create}

  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :users

  has_many :recommendations, dependent: :destroy

  paginates_per 20
end

class Rating < ActiveRecord::Base
  validates :user, presence: true
  validates :movie, presence: true
  validates :stars, presence: true

  belongs_to :user
  belongs_to :movie
end

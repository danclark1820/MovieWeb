class Rating < ActiveRecord::Base
  validates :user, presence: true
  validates :chapstick, presence: true
  validates :stars, presence: true

  belongs_to :user
  belongs_to :movie
end

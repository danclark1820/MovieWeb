module Seeders
  module RatingSeeder
    class << self

      def seed
        require 'csv'
        require 'securerandom'

        datafile = Rails.root + 'db/data/ratings.txt'
        n = 1

        CSV.foreach(datafile, {col_sep: "\t"}) do |row|
          #binding.pry
          movie_seed_id = row[1].to_i
          movie = Movie.find_by(seed_id: movie_seed_id)
          if movie.nil?
            puts "WARNING: rating found with no associated movie (seed: #{movie_seed_id})"
            next
          end

          user_seed_id = row[0]

          user = User.find_by(seed_id: user_seed_id)
          if user.nil?
            user = User.create!({
              seed_id: user_seed_id,
              email: "seed_user_#{n}@example.com",
              password: SecureRandom.hex
            })


          end
          n += 1
          Rating.create!(movie: movie, user: user, stars: row[2])
        end
      end

    end
  end
end

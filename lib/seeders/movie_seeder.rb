module Seeders
  module MovieSeeder
    class << self

      def seed
        require 'csv'

        datafile = Rails.root + 'db/data/movie.csv'

        CSV.foreach(datafile, headers: false) do |row|

          Movie.find_or_create_by({seed_id: row[0]}) do |movie|
            movie.title = row[1].gsub(/\([^\(]*\)\z/, '')
            movie.year = /\([^\(]*\)\z/.match(row[1])
            movie.url = row[4]
            movie.save!
          end
        end
      end

    end
  end
end

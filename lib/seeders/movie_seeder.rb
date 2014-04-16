module Seeders
  module MovieSeeder
    class << self

      def fix_encoding(text)
        text.encode('UTF-16BE', invalid: :replace, replace: '?').encode('UTF-8')
      end

      def seed
        require 'csv'
        datafile = Rails.root + 'db/data/movie_2.csv'
        File.write(datafile, fix_encoding(File.read(datafile)))
        Movie.delete_all

        CSV.foreach(datafile, headers: false) do |row|
          movie_seed_id = row[0].to_i

          movie = Movie.find_by({seed_id: movie_seed_id})

          if movie.nil?
            movie = Movie.create!({
              seed_id: movie_seed_id,
              title: row[1].gsub(/\([^\(]*\)\z/, '').to_s,
              year: (/\d{4}/.match(row[1])).to_s,
              url: row[4]
            })
          end

        end

      end

    end
  end
end

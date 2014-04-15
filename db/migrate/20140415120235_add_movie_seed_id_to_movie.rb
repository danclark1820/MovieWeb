class AddMovieSeedIdToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :seed_id, :integer
  end
end

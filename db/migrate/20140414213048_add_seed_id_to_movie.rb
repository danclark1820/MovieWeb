class AddSeedIdToMovie < ActiveRecord::Migration
  def change
    add_collumn :movies, :seed_id, :integer
  end
end

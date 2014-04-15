class AddSeedIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :seed_id, :integer
  end
end

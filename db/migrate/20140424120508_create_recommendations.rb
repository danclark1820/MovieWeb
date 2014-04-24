class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id, null: false
      t.integer :movie_id, null: false
      t.integer :score, null: false

      t.timestamps
    end
  end
end

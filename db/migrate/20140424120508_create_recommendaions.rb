class CreateRecommendaions < ActiveRecord::Migration
  def change
    create_table :recommendaions do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :score

      t.timestamps
    end
  end
end

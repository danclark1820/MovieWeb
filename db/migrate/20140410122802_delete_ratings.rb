class DeleteRatings < ActiveRecord::Migration
  def up
    drop_table :ratings
  end

  def down
    create_table :ratings do |t|
      t.integer :value
      t.integer :user_id
      t.integer :movie_id
    end
  end
end

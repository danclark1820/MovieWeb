class AddAttributesToMoviesTable < ActiveRecord::Migration
  def change
    add_column :movies, :title, :string, null: false
    add_column :movies, :year, :string, null: false
    add_column :movies, :url, :string, null: false
    add_column :movies, :unknown, :boolean, null:false
    add_column :movies, :action, :boolean, null:false
    add_column :movies, :adventure, :boolean, null:false
    add_column :movies, :animation, :boolean, null:false
    add_column :movies, :childrens, :boolean, null:false
    add_column :movies, :comedy, :boolean, null:false
    add_column :movies, :crime, :boolean, null:false
    add_column :movies, :documentary, :boolean, null:false
    add_column :movies, :drama, :boolean, null:false
    add_column :movies, :fantasy, :boolean, null:false
    add_column :movies, :filmnoir, :boolean, null:false
    add_column :movies, :horror, :boolean, null:false
    add_column :movies, :musical, :boolean, null:false
    add_column :movies, :mystery, :boolean, null:false
    add_column :movies, :romance, :boolean, null:false
    add_column :movies, :scifi, :boolean, null:false
    add_column :movies, :thriller, :boolean, null:false
    add_column :movies, :war, :boolean, null:false
    add_column :movies, :western, :boolean, null:false

  end
end

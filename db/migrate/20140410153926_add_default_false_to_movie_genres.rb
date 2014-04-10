class AddDefaultFalseToMovieGenres < ActiveRecord::Migration
  def up
    change_column :movies, :unknown, :boolean, default: false
    change_column :movies, :action, :boolean, default: false
    change_column :movies, :adventure, :boolean, default: false
    change_column :movies, :animation, :boolean, default: false
    change_column :movies, :childrens, :boolean, default: false
    change_column :movies, :comedy, :boolean, default: false
    change_column :movies, :crime, :boolean, default: false
    change_column :movies, :documentary, :boolean, default: false
    change_column :movies, :drama, :boolean, default: false
    change_column :movies, :fantasy, :boolean, default: false
    change_column :movies, :filmnoir, :boolean, default: false
    change_column :movies, :horror, :boolean, default: false
    change_column :movies, :musical, :boolean, default: false
    change_column :movies, :mystery, :boolean, default: false
    change_column :movies, :romance, :boolean, default: false
    change_column :movies, :scifi, :boolean, default: false
    change_column :movies, :thriller, :boolean, default: false
    change_column :movies, :war, :boolean, default: false
    change_column :movies, :western, :boolean, default: false
  end

  def down
    change_column :movies, :unknown, :boolean, default: nil
    change_column :movies, :action, :boolean, default: nil
    change_column :movies, :adventure, :boolean, default: nil
    change_column :movies, :animation, :boolean, default: nil
    change_column :movies, :childrens, :boolean, default: nil
    change_column :movies, :comedy, :boolean, default: nil
    change_column :movies, :crime, :boolean, default: nil
    change_column :movies, :documentary, :boolean, default: nil
    change_column :movies, :drama, :boolean, default: nil
    change_column :movies, :fantasy, :boolean, default: nil
    change_column :movies, :filmnoir, :boolean, default: nil
    change_column :movies, :horror, :boolean, default: nil
    change_column :movies, :musical, :boolean, default: nil
    change_column :movies, :mystery, :boolean, default: nil
    change_column :movies, :romance, :boolean, default: nil
    change_column :movies, :scifi, :boolean, default: nil
    change_column :movies, :thriller, :boolean, default: nil
    change_column :movies, :war, :boolean, default: nil
    change_column :movies, :western, :boolean, default: nil
  end
end

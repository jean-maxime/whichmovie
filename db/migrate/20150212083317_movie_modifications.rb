class MovieModifications < ActiveRecord::Migration
  def change
    add_column :movies, :id_movie_api, :int
    add_column :movies, :image_url, :string
  end
end

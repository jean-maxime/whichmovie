class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :movie_name
    	t.text :description
    	t.string :trailer
      t.timestamps
    end
  end
end

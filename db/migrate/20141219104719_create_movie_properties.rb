class CreateMovieProperties < ActiveRecord::Migration
  def change
    create_table :movies_properties do |t|
    	t.integer :user_id
    	t.integer :movie_id
    	t.string :status
      t.timestamps
    end
  end
end

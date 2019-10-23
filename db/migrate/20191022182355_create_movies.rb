class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :poster
      t.string :genre
      t.integer :rating
      t.string :imdb_id
      t.timestamps
    end
  end
end

class CreateMovieLists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_lists do |t|

      t.belongs_to :list
      t.belongs_to :movie
      t.timestamps
    end
  end
end

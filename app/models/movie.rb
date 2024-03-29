class Movie < ApplicationRecord
  has_many :movie_lists
  has_many :lists, through: :movie_lists

  validates :imdb_id, :presence => true, :uniqueness => true
end

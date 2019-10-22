class List < ApplicationRecord
  validates :name, presence: true

  has_many :movie_lists
  has_many :movies, through: :movie_lists
end

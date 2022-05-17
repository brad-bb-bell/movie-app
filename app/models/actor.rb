class Actor < ApplicationRecord
  validates :first_name, length: { minimum: 2 }
  validates :last_name, length: { minimum: 2 }
  validates :known_for, presence: true
  validates :age, comparison: { greater_than: 13 }
  belongs_to :movie

  def plot
    movie = Movie.find_by(id: movie_id)
    movie.plot
  end
end

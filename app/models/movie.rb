class Movie < ApplicationRecord
  validates :title, length: { minimum: 2 }
  validates :plot, presence: true
  has_many :actors
end

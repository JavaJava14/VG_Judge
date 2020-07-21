class Review < ApplicationRecord
  has_many :games
  has_many :users, through: :games
  validates :rating, :summary, :opinion, presence: true
  validates_numericality_of :rating, :greater_than_or_equal_to => 1, :less_than_or_equal_to =>10
end
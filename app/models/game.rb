class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :review
  has_many :genres
  accepts_nested_attributes_for :review
  validates :title, :developer, :year, :genre_ids, presence: true
  scope :search_by_title, -> (search_title){where("title = ?", search_title)}
end
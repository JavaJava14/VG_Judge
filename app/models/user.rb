class User < ActiveRecord::Base
  has_many :games
  has_many :reviews, through: :games
  validates :username, :password, presence: true
  validates_uniqueness_of :username
  has_secure_password

  def self.find_or_create_by_omniauth(auth)
    self.where(:username => auth["info"]["name"]).first_or_create do |user|
      user.password = SecureRandom.hex
    end
  end

  def self.most_reviews
    self.joins(:games)
        .group(:id)
        .order('COUNT(games.id) DESC')
        .limit(1)
  end
end
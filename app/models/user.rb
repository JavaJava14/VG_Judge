class User < ActiveRecord::Base
has_many :games
has_many :favorites, through: :games
validates :username, :password, presence: true
validates_uniqueness_of :username
has_secure_password
end
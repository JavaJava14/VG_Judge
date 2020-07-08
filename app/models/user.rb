class User < ActiveRecord::Base
has_many :games
has_many :favorites, through: :games
end
class Genre < ApplicationRecord
	belongs_to :game, optional: true
end
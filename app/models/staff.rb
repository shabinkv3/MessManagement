class Staff < ApplicationRecord
	belongs_to :mess

	validates :name, presence: true
	validates :phoneno, presence: true
end

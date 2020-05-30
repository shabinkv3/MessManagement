class Extra < ApplicationRecord
	belongs_to :student

	validates :price, presence: true
	validates :item, presence: true
	validates :student_id, presence: true
end

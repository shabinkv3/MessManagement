class MessCut < ApplicationRecord
	belongs_to :student

	validates :from_date, presence: true
	validates :to_date, presence: true
	validates :no_of_days, presence: true
	validates :student_id, presence: true
end

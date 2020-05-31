class Messcut < ApplicationRecord
	belongs_to :student

	validates :fromdate, presence: true
	validates :todate, presence: true
	validates :no_of_days, presence: true
	validates :student_id, presence: true
end

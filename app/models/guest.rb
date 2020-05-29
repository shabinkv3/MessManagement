class Guest < ApplicationRecord
	belongs_to :student

	validates :name, presence: true
	validates :rollno, presence: true
	validates :date, presence: true
	validates :student_id, presence: true

end

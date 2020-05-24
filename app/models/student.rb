class Student < ApplicationRecord
  has_secure_password

  validates :rollno, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end

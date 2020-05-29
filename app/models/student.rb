class Student < ApplicationRecord
  has_secure_password
  belongs_to :mess
  has_many :guests

  
  validates :rollno, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

end

class Student < ApplicationRecord
  has_secure_password
  belongs_to :mess
  has_many :guests
  has_many :extras
  has_many :mess_cuts

  
  validates :rollno, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password,length: { minimum: 6, maximum: 20 }
end

class Mess < ApplicationRecord
  has_secure_password
  has_many :students
  has_many :staffs
  has_many :extras
  
  
  validates :mess_name, presence: true, uniqueness: true
  validates :password,length: { minimum: 6, maximum: 20 }

end

class Mess < ApplicationRecord
  has_secure_password
  has_many :students
  has_many :staffs

  validates :mess_name, presence: true, uniqueness: true

end

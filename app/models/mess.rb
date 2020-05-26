class Mess < ApplicationRecord
  has_secure_password
  has_many :students

  validates :mess_name, presence: true, uniqueness: true

end

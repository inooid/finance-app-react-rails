# The representation of the user
class User < ActiveRecord::Base
  has_secure_password

  # - Before/after hooks ------------------------------------------------------#

  # - Validations -------------------------------------------------------------#
  validates :username, presence: true, uniqueness: true, length: { in: 3..36 }
  validates :email, email: true, presence: true, uniqueness: true
end

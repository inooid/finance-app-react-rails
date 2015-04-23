# The representation of the user
class User < ActiveRecord::Base
  has_secure_password

  # - Before/after hooks ------------------------------------------------------#

  # - Validations -------------------------------------------------------------#
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i

  validates :username, presence: true, uniqueness: true, length: { in: 3..36 }
  validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX
end

# Sets up the authentication for the user
class AuthenticateUser
  # Used for the 'Simple_Command' gem
  prepend SimpleCommand

  # Sets instance variables for email and password
  # @param email [String] the e-mail address to authenticate with
  # @param password [String] the password to authenticate with
  def initialize(email, password)
    @email = email
    @password = password
  end

  # If user is logged in, creates a new JSONWebToken with the user_id
  # @return [JSONWebToken] the JSONWebToken that will be send back to the client
  def call
    JSONWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  # Checks whether or not the user is in the database and that the password
  # matches
  # @return [nil]
  def user
    user = User.by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

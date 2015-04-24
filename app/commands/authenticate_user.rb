# Sets up the authentication for the user
class AuthenticateUser
  # put SimpleCommand before the class' ancestors chain
  prepend SimpleCommand

  # Sets instance variables for email and password
  # @param email [String] the e-mail address to authenticate with
  # @param password [String] the password to authenticate with
  def initialize(email, password)
    @email = email
    @password = password
  end

  # If user is logged in, creates a new JsonWebToken with the user_id
  # @return [JsonWebToken] the JsonWebToken that will be send back to the client
  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  # Checks whether or not the user is in the database and that the password
  # matches
  # @return [nil]
  def user
    user = User.find_by(email: @email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'Invalid credentials'
    nil
  end
end

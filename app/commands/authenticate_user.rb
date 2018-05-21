class AuthenticateUser
  prepend SimpleCommand

  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    # byebug
    JsonWebToken.encode(user_id: user.id.to_s) if user
    JsonWebToken.encode(user_login: user.login) if user
  end

  private

  attr_accessor :login, :password

  def user
    user = User.find_by(:login => login)
    # byebug
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

class AuthenticateUser
  prepend SimpleCommand

  def initialize(login, password)
    @login = login
    @password = password
  end

  def call
    # byebug
    # JsonWebToken.encode(user_id: user.id.to_s) if user
    payload = {}
    payload[:user_id] = user.id.to_s
    payload[:user_login] = user.login

    JsonWebToken.encode(payload) if user
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

class User::Authenticator

  def initialize(user)
    @user = user
  end

  def authenticate(unencrypted_password)
    return false unless @user

    if BCrypt::Password.new(@user.hashed_password) == unencrypted_password
      @user
    else
      false
    end
  end
end

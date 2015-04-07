class User::LoginForm
  include ActiveModel::Model

  attr_accessor :nickname, :password
end

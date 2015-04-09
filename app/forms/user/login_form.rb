class User::LoginForm
  include ActiveModel::Model

  attr_accessor :display_name, :password
end

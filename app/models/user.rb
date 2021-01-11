class User < ActiveRecord::Base
  has_secure_password

  validates :password, presence: true { minimum: 4, maximum: 30}

  validates :email, presence: true
  validates :password_confirmation, presence: true


end

class User < ActiveRecord::Base
  has_secure_password

  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { minimum: 3, maximum: 8 }


  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
      if user && user.authenticate(password.strip)
      return user
      else
      return nil
    end
  end


end

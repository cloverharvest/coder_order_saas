class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }

  # no multiple dots allowed
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 61 },
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }

  #hsp is limited and allows records with empty password, that's why we need to do a validation in the line after
  #hsp plus it automatically adds an authenticate method to the user model
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}

  # returns the hash digest of a string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)                                                  
  end
end

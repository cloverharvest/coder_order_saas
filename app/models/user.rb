class User < ApplicationRecord
  attr_accessor :remember_token

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

  class << self
  # returns the hash digest of a string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    #returns a random token//adds method to generate tokens
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # remembers a user in the database for use in persistent sessions (cookies)
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # returns true of the given token matches the digest
  # the ff. remember_token is a variable local to the authenticated? method and
  # NOT connected in any way to the remember_token on line 2
  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end

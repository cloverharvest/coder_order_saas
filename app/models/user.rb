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
end

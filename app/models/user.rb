class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest


  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }

  # no multiple dots allowed
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 61 },
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true

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

  # returns true if the given token matches the digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # forget the user
  def forget
    update_attribute(:remember_digest, nil)
  end

  # activates an account
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
    # update_attribute(:activated, true)
    # update_attribute(:activated_at, Time.zone.now)
  end

  # sends activation mail
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

    #Converts email to all lower-case.
    def downcase_email
      email.downcase!
      # self.email = email.downcase
    end

    #Creates and assigns the activation token and digest
    def create_activation_digest
      self.activation_token = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end

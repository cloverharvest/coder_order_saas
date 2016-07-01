class Contact < ApplicationRecord
  validates :name, :email, :comments, presence: true
  validate :comments, length: { in: 5..1000, too_long: "%#{count} characters is the maximum allowed"}
end

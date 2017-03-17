class User < ActiveRecord::Base
  attr_accessor :password_confirmation
  has_many :ratings

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, :password, presence: true
  validates :password, length: { minimum: 5 }
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validate :password_matcher

  protected
  def password_matcher
    if self.password != self.password_confirmation
      errors.add(:password_confirmation, "Passwords do not match")
    end
  end

end

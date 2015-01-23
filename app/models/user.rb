class User < ActiveRecord::Base
  EMAIL_RE = /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z]+)?\z/i

  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true,
    format: {with: EMAIL_RE},
    uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 8}

  has_secure_password  # Adds virtual password & password_confirmation and some related features.

end

class User < ActiveRecord::Base
  EMAIL_RE = /\A[\w+\-.]+@[a-z\d\-.]+[a-z]+\z/i

  validates :name, presence: true, length: {maximum: 100}
  validates :email, presence: true, format: {with: EMAIL_RE},
    uniqueness: {case_sensitive: false}

end

class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true

  has_many :decors
  has_many :categories
end

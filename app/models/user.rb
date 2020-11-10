class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :username, presence: true
  validates :email, presence: true

  has_many :decors
  has_many :categories
end
